package kr.dogcat.utils;

public class ThePagerVSearch {
	 private int pageSize;//한 페이지당 데이터 개수
	 private int pagerSize;//번호로 보여주는 페이지 Link 개수
	 private int dataCount;//총 데이터 수
	 private int currentPage;//현재 페이지 번호
	 private int pageCount;//총 페이지 수
	 private String option;//검색 옵션
	 private String pet;//검색 단어
	 
	 private String linkUrl;//페이저가 포함되는 페이지의 주소
	 
	 public ThePagerVSearch(String option, String pet, int dataCount, int currentPage, 
	  int pageSize, int pagerSize, String linkUrl) {
	  
	  this.linkUrl = linkUrl;
	  
	  this.option = option;
	  this.pet = pet;
	  this.dataCount = dataCount; // 총 게시물 개수
	  this.pageSize = pageSize; // 5 10 15 20
	  this.pagerSize = pagerSize; // 3
	  this.currentPage = currentPage; // 현재 페이지 
	  this.pageCount = 
	   (dataCount / pageSize) + ((dataCount % pageSize) > 0 ? 1 : 0);
	  // 총 게시물 / 페이지사이즈(5 10 ..) +  나머지 (1) || 나누어 떨어지면 (0) 
	  //     총 페이지 수
	  
	  System.out.println(option);
	  System.out.println(pet);
	  System.out.println(pageSize);
	  System.out.println(pagerSize);
	  System.out.println(currentPage);
	  System.out.println(pageCount);
	  
	 }
	 
	 
	 
	 public String toString(){
	  StringBuffer linkString = new StringBuffer();
	  
	  //1. 처음, 이전 항목 만들기  -- 번호 리스트 좌측
	  if (currentPage > 1) {
	   linkString.append(
	    String.format("[<a href='%s?cp=1&option=%s&pet=%s'>처음</a>]",linkUrl,option,pet));
	   linkString.append("&nbsp;");
	   linkString.append("&nbsp;");
	   linkString.append(String.format(
	    "[<a href='%s?cp=%d&option=%s&pet=%s'>이전</a>]", linkUrl, currentPage - 1,option,pet));
	   linkString.append("&nbsp;");
	  }
	  
	  //2. 페이지 번호 Link 만들기
	  // 총페이지 8 [1 2 3] [4 5 6] [7 8]
	  // pagerSize 3
	  int pagerBlock = (currentPage - 1) / pagerSize; // (1-1)/ 3 = 0 1 2 3
	  int start = (pagerBlock * pagerSize) + 1; // 1 1*3+1 4  // 2*3+1 = 7
	  int end = start + pagerSize; // 1 + 3 = 4 // 4+3 = 7 // 7+3 = 10  [7 8 9]
	  for (int i = start; i < end; i++) {
	   if (i > pageCount) break; // i가 pageCount를 넘어가면 더이상 번호를 만들지 않고 break 하여 for문 탈출 : 9는 출력이 안됨
	   linkString.append("&nbsp;");
	   if(i == currentPage) { // 현재 페이지가 i 라면 번호 형성 [ i ] 처럼 현재 해당되는 위치에 괄호 표시
	    linkString.append(String.format("[%d]", i));
	   } else { 
	    linkString.append(String.format( // 그렇지 않으면 i에 해당하는 페이지에 해당하는 번호 형성 ( !!! [ ] 괄호 없음 )
	     "<a href='%s?cp=%d&option=%s&pet=%s'>%d</a>", linkUrl, i, option,pet, i));
	   }
	   linkString.append("&nbsp;");
	  }
	  
	  
	  //3. 다음, 마지막 항목 만들기 -- 번호 리스트 우측
	  if (currentPage < pageCount) { // 현재페이지가 총 페이지보다 작다면
	   linkString.append("&nbsp;");
	   linkString.append(String.format(
	    "[<a href='%s?cp=%d&option=%s&pet=%s'>다음</a>]",linkUrl, currentPage + 1,option,pet)); // 다음으로 가는 페이지 형성
	   linkString.append("&nbsp;");
	   linkString.append("&nbsp;");
	   linkString.append(String.format(
	    "[<a href='%s?cp=%d&option=%s&pet=%s'>마지막</a>]", linkUrl, pageCount,option,pet)); // 마지막으로 가는 페이지 형성
	  }
	  
	  return linkString.toString();
	 }
}
