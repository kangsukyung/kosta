package kosta.todayroom.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kosta.todayroom.domain.BoardAttachVO;
import kosta.todayroom.domain.BoardVO;
import kosta.todayroom.domain.Criteria;
import kosta.todayroom.domain.KnowhowVO;
import kosta.todayroom.domain.PageDTO;
import kosta.todayroom.domain.RoomwarmingVO;
import kosta.todayroom.service.BoardService;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@Log4j
public class BoardController {
	@Setter(onMethod_ = @Autowired)
	private BoardService service;

	@GetMapping("/list")
	public void BoardList(Criteria cri, Model model) {
		log.info("list..........");

		model.addAttribute("board", service.boardList(cri));

		int total = service.boardTotalCount(cri);

		model.addAttribute("pageMaker", new PageDTO(cri, total));

		model.addAttribute("memberList", service.memberList());
	}

	@GetMapping("/register")
	public void BoardRegister() {
		log.info("register..........");
	}

	@Transactional
	@PostMapping("/register")
	public String BoardRegister(BoardVO board, RoomwarmingVO room, KnowhowVO know, RedirectAttributes rttr) {
		log.info("========== INSERT ==========");

		log.info("register : " + board);

		if (board.getAttachList() != null) {
			board.getAttachList().forEach(attach -> log.info(attach));
		}

		log.info("========== INSERT ==========");

		service.register(board);

		if (room.getRoomwarming_type() != null) {
			service.roomRegister(room);
		}

		if (know.getKnowhow_style() != null) {
			service.knowhowRegister(know);
		}

		rttr.addFlashAttribute("result", board.getBoard_seq());

		return "redirect:/board/list";
	}

	@GetMapping({ "/read", "/modify" })
	public void BoardRead(@RequestParam("board_seq") int board_seq, Model model) {
		log.info("read...........");

		model.addAttribute("member", service.member(board_seq));
		model.addAttribute("board", service.read(board_seq));
		model.addAttribute("room", service.roomwarming(board_seq));
		model.addAttribute("knowhow", service.knowhow(board_seq));
	}

	@Transactional
	@PostMapping("/modify")
	public String BoardModifyd(BoardVO board, RoomwarmingVO room, KnowhowVO know, RedirectAttributes rttr,
			Model model) {

		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}

//		if (room.getRoomwarming_type() != null) {
//			service.roomRegister(room);
//		}
//
//		if (know.getKnowhow_style() != null) {
//			service.knowhowRegister(know);
//		}

		return "redirect:/board/read?board_seq=" + board.getBoard_seq();
	}

	@Transactional
	@PostMapping("/remove")
	public String BoardRemove(@RequestParam("board_seq") int board_seq, RedirectAttributes rttr) {
		log.info("remove..........");
		
		List<BoardAttachVO> attachList = service.readAttachList(board_seq);

		if (board_seq != 0) {
			service.removeRoom(board_seq);
			service.removeKnowhow(board_seq);
		}

		if (service.remove(board_seq)) {
			
			//delete attach files
			deleteFiles(attachList);
			
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/board/list";
	}

	// 특정한 게시물 번호를 이용해서 첨부파일과 관련된 데이터를 JSON으로 반환
	@GetMapping(value = "/readAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> readAttachList(int board_seq) {

		log.info("readAttachList : " + board_seq);

		return new ResponseEntity<>(service.readAttachList(board_seq), HttpStatus.OK);
	}

	// 파일 삭제 처리
	private void deleteFiles(List<BoardAttachVO> attachList) {

		if (attachList == null || attachList.size() == 0) {
			return;
		}

		log.info("delete attach files...................");
		log.info(attachList);

		attachList.forEach(attach -> {
			try {
				Path file = Paths.get(
						"C:\\upload\\" + attach.getUploadPath() + "\\" + attach.getUuid() + "_" + attach.getFileName());

				Files.deleteIfExists(file);

				if (Files.probeContentType(file).startsWith("image")) {

					Path thumbNail = Paths.get("C:\\upload\\" + attach.getUploadPath() + "\\s_" + attach.getUuid() + "_"
							+ attach.getFileName());

					Files.delete(thumbNail);
				}

			} catch (Exception e) {
				log.error("delete file error" + e.getMessage());
			} // end catch
		});// end foreachd
	}
}
