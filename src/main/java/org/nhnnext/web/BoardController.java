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
	
	@RequestMapping("/board/form")
	public String form() {
		return "form";
	}
	

	@RequestMapping(value="/board", method=RequestMethod.POST)
	public String create(Board board, MultipartFile file) {
		System.out.println("board :" + board);
		
		String fileName = FileUploader.upload(file);
		board.setFileName(fileName);
		//FileUploader.getDestinationFile(fileName);
		
		Board savedBoard = boardRepository.save(board);
//		model.addAttribute("board", savedBoard);
		return "redirect:/board/" + savedBoard.getId();
	}
	
	@RequestMapping("/{id}")
	public String show(@PathVariable Long id, Model model){
		Board savedBoard = boardRepository.findOne(id);
		model.addAttribute("board", savedBoard);
		return "show";
	}
	
	
}



