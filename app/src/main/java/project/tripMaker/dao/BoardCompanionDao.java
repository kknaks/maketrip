package project.tripMaker.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import project.tripMaker.vo.Board;

import java.util.List;
import java.util.Map;

@Mapper
public interface BoardCompanionDao extends BoardDao{

  // 게시물 목록 조회
  List<Board> list(Map<String, Object> options) throws Exception;

  // 좋아요 순으로 정렬된 목록 조회
  List<Board> listLike(Map<String, Object> options) throws Exception;

  // 즐겨찾기 순으로 정렬된 목록 조회
  List<Board> listFavor(Map<String, Object> options) throws Exception;

  // 조회수 순으로 정렬된 목록 조회
  List<Board> listView(Map<String, Object> options) throws Exception;

  // 게시물 등록
  boolean insert(Board board) throws Exception;

  Board findBy(int boardNo) throws Exception;

  void updateViewCount(@Param("boardNo")int boardNo, @Param("boardCount")int boardCount) throws Exception;

  int countAll(int no) throws Exception;

  boolean delete(@Param("boardNo")int boardNo) throws Exception;

  boolean update(Board board) throws Exception;

  Board selectIdNoByTripNo(int tripNo, int userNo) throws Exception;
}
