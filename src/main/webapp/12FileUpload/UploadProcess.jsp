<%@page import="fileupload.MyfileDAO"%>
<%@page import="fileupload.MyfileDTO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 물리적 경로 얻어옴.
String saveDirectory = application.getRealPath("/Uploads");
// 파일 업로드 용량.
int maxPostSize = 1024 * 1000;
// 인코딩 방식 지정.
String encoding = "UTF-8";

try {
	// 객체 생성 및 파일 업로드 완료
	MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding);
	
	// mr 객체를 통해 서버에 저장된 파일명을 가져온다.
	String fileName = mr.getFilesystemName("attachedFile");
	// 파일명에서 확장자 앞의 '.' 을 찾아 index를 확인한 후 확장자를 잘라낸다.
	String ext = fileName.substring(fileName.lastIndexOf("."));
	// 현재 날짜와 시간 및 밀리세컨즈(대문자 S)까지 이용해서 파일명으로 사용할 문자열을 만든다.
	String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
	// 확장자와 파일명을 합쳐서 저장할 파일명을 만들어 준다.
	String newFileName = now + ext;
	
	// 서버에 저장된 파일명을 새로운 파일명으로 변경해준다.
	File oldFile = new File(saveDirectory + File.separator + fileName);
	File newFile = new File(saveDirectory + File.separator + newFileName);
	oldFile.renameTo(newFile);
	
	/*
	파일을 제외한 나머지 form값을 받는다. 단 이때 request 내장 객체를 통해서가 아니라
	mr 객체를 통해 받아야 하므로 주의해야 한다.
	객체는 다르지만 form값을 받기 위한 메소드 명은 동일하다.
	*/
	String name = mr.getParameter("name");
	String title = mr.getParameter("title");
	String[] cateArray = mr.getParameterValues("cate");
	StringBuffer cateBuf = new StringBuffer();
	if(cateArray == null) {
		cateBuf.append("선택 없음");
	} else {
		for(String s : cateArray) {
			cateBuf.append(s + ", ");
		}
		
	}
	MyfileDTO dto = new MyfileDTO();
	
	dto.setName(name);
	dto.setTitle(title);
	dto.setCate(cateBuf.toString());
	dto.setOfile(fileName);
	dto.setSfile(newFileName);

	MyfileDAO dao = new MyfileDAO();
	dao.insertFile(dto);
	dao.close();
	// 파일 업로드에 성공한 경우 파일목록으로 이동한다.
	response.sendRedirect("FileList.jsp");
			
} catch (Exception e) {
	e.printStackTrace();
	// 파일 업로드에 실패하면 request 영역에 메세지를 저장한다.
	request.setAttribute("errorMessage", "파일 업로드 오류");
	request.getRequestDispatcher("FileUploadMain.jsp").forward(request, response);
}
%>