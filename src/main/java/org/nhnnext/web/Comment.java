package org.nhnnext.web;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import org.codehaus.jackson.annotate.JsonIgnore;

@Entity
public class Comment {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(length=100, nullable=true)
	private String nickname;
	
	@Column(length=5000, nullable=true)
	private String contents;

	@Override
	public String toString() {
		return "Comment [nickname=" + nickname + ", contents=" + contents + "]";
	}
	
	@ManyToOne
	@JsonIgnore
	private Board board;
	
	public Comment() {
		
	}
	
	public Comment(String contents, Board board) {
		this.board = board;
		this.contents = contents;
	}
	
	
	public Board getBoard() {
		return board;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public void setBoard(Board board) {
		this.board = board;
	}
	

}
