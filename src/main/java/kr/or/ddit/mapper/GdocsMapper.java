package kr.or.ddit.mapper;

import kr.or.ddit.vo.GdocsVO;

public interface GdocsMapper {
	
	public int insertDocs(String proNo);
	public int certifyDocs(GdocsVO gdocsVO);
	public GdocsVO selectOne(String proNo);
	
}
