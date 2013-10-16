package org.nhnnext.web;

import org.nhnnext.repository.BoardRepository;
import org.nhnnext.support.FileUploader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;


@Controller
public class BoardController {
	@Autowired
	private BoardRepository boardRepository;

	@RequestMapping("/board")
	public String list(Model model) {
		model.addAttribute("boards", boardRepository.findAll());
		return "list";
	}
	
	
	@RequestMapping("/board/form")
	public String form() {
		return "form";
	}

	@RequestMapping("/board/{id}/modifiy")
	public String modifiy(@PathVariable Long id, Model model) {
		Board board = boardRepository.findOne(id);
		model.addAttribute("board", board);
		return "form_modified";
	}

	@RequestMapping("/board/{id}/delete")
	public String delete(@PathVariable Long id) {
		Board board = boardRepository.findOne(id);
		boardRepository.delete(board);
		return "form";
	}

	@RequestMapping(value = "/board/{id}/complete", method = RequestMethod.POST)
	public String modifiyComplete(@PathVariable Long id, Board board,
			MultipartFile file) {
		String newFileName = FileUploader.upload(file);
		Board originBoard = boardRepository.findOne(id);

		originBoard.setFileName(newFileName);
		originBoard.setFileName(board.getContents());
		originBoard.setFileName(board.getFileName());

		boardRepository.save(originBoard);

//		return "redirect:/board/" + id;
		return "redirect:/board/" + originBoard.getId();
	}

	@RequestMapping(value = "/board", method = RequestMethod.POST)
	public String create(Board board, MultipartFile file) {
		System.out.println("board :" + board);

		String fileName = FileUploader.upload(file); // FileUploader API를 활용해
														// 업로드한 파일을 복사
		board.setFileName(fileName); // 첨부한 이미지 정보를 데이터베이스에 추가
		// FileUploader.getDestinationFile(fileName);

		Board savedBoard = boardRepository.save(board);
		// model.addAttribute("board", savedBoard);
		return "redirect:/board/" + savedBoard.getId();
	}

	@RequestMapping("/board/{id}")
	public String show(@PathVariable Long id, Model model) {
		Board savedBoard = boardRepository.findOne(id);
		model.addAttribute("board", savedBoard);
		return "show";
	}

}
