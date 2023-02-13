package kr.or.ddit.controller.project.service;

import kr.or.ddit.vo.GdocsVO;

public interface IGdocsService {
	public int insertDocs(String porNo);
	public int certifyDocs(GdocsVO gdocsVO);
	public GdocsVO selectOne(String proNo);
}
