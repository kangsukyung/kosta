package kosta.todayroom.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import kosta.todayroom.domain.Criteria;
import kosta.todayroom.domain.ReviewAttachVO;
import kosta.todayroom.domain.ReviewPageVO;
import kosta.todayroom.domain.ReviewVO;
import kosta.todayroom.service.ReviewService;
import kosta.todayroom.service.ReviewServiceImpl;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@RestController
@Log4j
@RequestMapping("/review/")
public class ReviewController {
	@Setter(onMethod_=@Autowired)
	private ReviewServiceImpl service;
	
	//리뷰쓰기
	@PostMapping(value = "/register", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> reviewRegister(@RequestBody ReviewVO vo) {
		
		int insertCount = service.reviewRegister(vo);
		log.info("Reply INSERT COUNT: " + insertCount);

		return insertCount == 1 
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
		//목록
		@GetMapping(value = "/pages/{store_seq}/{page}",produces = {MediaType.APPLICATION_XML_VALUE,MediaType.APPLICATION_JSON_UTF8_VALUE})
		public ResponseEntity<ReviewPageVO> reviewList(@PathVariable("page") int page, @PathVariable("store_seq") int store_seq) {
			log.info("getList............");
			Criteria cri = new Criteria(page,5);
			log.info("store_seqqqqqqqqq : "+store_seq);
			return new ResponseEntity<>(service.ReviewListPage(cri, store_seq),HttpStatus.OK);
		}
		
		
		
		//상세
		@GetMapping(value="/{review_seq}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
		public ResponseEntity<ReviewVO> reviewRead(@PathVariable("review_seq") int review_seq){
			
			return new ResponseEntity<>(service.reviewRead(review_seq),HttpStatus.OK);
		}
		
		
		//삭제
		@DeleteMapping(value="/{review_seq}", produces = {MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String> reviewRemove(@PathVariable("review_seq") int review_seq){
			return service.reviewRemove(review_seq) == 1 
					? new ResponseEntity<>("success",HttpStatus.OK)
					: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		
		//수정
		@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
				value="/{review_seq}", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String> modify(@RequestBody ReviewVO vo, @PathVariable("review_seq") int review_seq){
			vo.setReview_seq(review_seq);
			
			log.info("modify:"+ vo);
			return service.reviewModify(vo) == 1 
					? new ResponseEntity<>("success",HttpStatus.OK)
					: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		@GetMapping("/uploadAjax")
		public void uploadAjax(){
			log.info("upload");
		}
		
		private String getFolder(){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			String str = sdf.format(date);
			
			return str.replace("-", File.separator);//여러 운영체제에 호환하는 방식으로 경로를 구하기 위해 File.separator를 사용
		}
		
		
		@PostMapping(value="/uploadAjaxAction" , produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
		@ResponseBody
		public ResponseEntity<List<ReviewAttachVO>> uploadAjaxPost(MultipartFile[] uploadFile){
			log.info("update ajax post....");
			
			List<ReviewAttachVO> list = new ArrayList<>();
			String uploadFolder = "C:\\upload";
			
			String uploadFolderPath = getFolder();
			
			//make folder --
			File uploadPath = new File(uploadFolder,getFolder());
			log.info("upload path : "+uploadPath);
			
			if(uploadPath.exists() == false){	//업로드 경로에 아무것도 없으면
				uploadPath.mkdirs();	//폴더 만들기
			}
			
			for(MultipartFile multipartFile : uploadFile){
				/*log.info("--------------files---------------------");
				log.info("upload file name : "+ multipartFile.getOriginalFilename());
				log.info("upload file size : "+ multipartFile.getSize());*/
				
				ReviewAttachVO attachDTO = new ReviewAttachVO();
				
				String uploadFileName = multipartFile.getOriginalFilename();
				
				//IE has file path
				uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
				attachDTO.setFileName(uploadFileName);
				
				UUID uuid = UUID.randomUUID();
				
				uploadFileName = uuid.toString() + "_" + uploadFileName;
				
				
				try {
					File saveFile = new File(uploadPath, uploadFileName);	//ajax는 파라미터에 파일이름도 같이 가져감
					multipartFile.transferTo(saveFile);
					
					attachDTO.setUuid(uuid.toString());
					attachDTO.setUploadPath(uploadFolderPath);
					
					// check image type file
					if (checkImageType(saveFile)) {
						
						attachDTO.setImage(true);
						
						 FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
						 Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100,100);
						 thumbnail.close();
					}
					
					// add to List
					list.add(attachDTO);
					
				} catch (Exception e) {
					log.error(e.getMessage());
				}
				
			}
			return new ResponseEntity<>(list, HttpStatus.OK);
		}
		
		private boolean checkImageType(File file){
			try {
				String contentType = Files.probeContentType(file.toPath());
				
				return contentType.startsWith("image");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return false;
		}
}
