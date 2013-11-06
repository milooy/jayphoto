package org.nhnnext.repository;

import java.util.List;

import org.nhnnext.web.Board;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface BoardRepository extends CrudRepository<Board, Long> {
	@Query("select b from Board b order by b.id desc")
	List<Board> findOrderByIdDesc();
}
