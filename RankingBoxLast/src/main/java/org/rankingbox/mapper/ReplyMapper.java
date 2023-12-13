package org.rankingbox.mapper;

import java.util.List;

import org.rankingbox.domain.Criteria;
import org.rankingbox.domain.ReplyVO;

public interface ReplyMapper {

  public List<ReplyVO> list(Integer bno) throws Exception;

  public void create(ReplyVO vo) throws Exception;

  public void update(ReplyVO vo) throws Exception;

  public void delete(Integer rno) throws Exception;

  public List<ReplyVO> listPage(Integer bno, Criteria cri) throws Exception;

  public int count(Integer bno) throws Exception;

  public int getBno(Integer rno) throws Exception;

}
