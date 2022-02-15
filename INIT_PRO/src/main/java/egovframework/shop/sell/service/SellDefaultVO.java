/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.shop.sell.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * @Class Name : SellDefaultVO.java
 * @Description : SellDefaultVO Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */
public class SellDefaultVO implements Serializable {

	/**
	 *  serialVersion UID
	 */
	private static final long serialVersionUID = -858838578081269359L;

	/** 검색조건 */
	   private String searchCondition = "";
	   private String searchConditionY = "";

	   public String getSearchConditionY() {
		return searchConditionY;
	}

	public void setSearchConditionY(String searchConditionY) {
		this.searchConditionY = searchConditionY;
	}

	/** 검색Keyword */
	   private String searchKeyword = "";

	   /** 검색사용여부 */
	   private String searchUseYn = "";

	   /** 현재페이지 */
	   private int pageIndex = 1;

	   /** 페이지갯수 */
	   private int pageUnit = 4;

	   /** 페이지사이즈 */
	   private int pageSize = 10;

	   /** firstIndex */
	   private int firstIndex = 1;

	   /** lastIndex */
	   private int lastIndex = 1;

	   /** recordCountPerPage */
	   private int recordCountPerPage = 10;
	   
	   private String prdNum;
	   
	   private String prdName;
	   
	   public String getPrdName() {
		return prdName;
	}

	public void setPrdName(String prdName) {
		this.prdName = prdName;
	}

	private String shopCode;
	   
	   public String getSaleSdate() {
		return saleSdate;
	}

	public void setSaleSdate(String saleSdate) {
		this.saleSdate = saleSdate;
	}

	public String getSaleFdate() {
		return saleFdate;
	}

	public void setSaleFdate(String saleFdate) {
		this.saleFdate = saleFdate;
	}

	private String saleNum;
	   
	   private String saleSdate;
	   
	   private String saleFdate;
	   
	   private String periodCnt;

	   public String getPeriodCnt() {
		return periodCnt;
	}

	public void setPeriodCnt(String periodCnt) {
		this.periodCnt = periodCnt;
	}

	public String getSaleNum() {
		return saleNum;
	}

	public void setSaleNum(String saleNum) {
		this.saleNum = saleNum;
	}

	public String getShopCode() {
	      return shopCode;
	   }

	   public void setShopCode(String shopCode) {
	      this.shopCode = shopCode;
	   }

	   public String getPrdNum() {
	      return prdNum;
	   }

	   public void setPrdNum(String prdNum) {
	      this.prdNum = prdNum;
	   }

	   public int getFirstIndex() {
	      return firstIndex;
	   }

	   public void setFirstIndex(int firstIndex) {
	      this.firstIndex = firstIndex;
	   }

	   public int getLastIndex() {
	      return lastIndex;
	   }

	   public void setLastIndex(int lastIndex) {
	      this.lastIndex = lastIndex;
	   }

	   public int getRecordCountPerPage() {
	      return recordCountPerPage;
	   }

	   public void setRecordCountPerPage(int recordCountPerPage) {
	      this.recordCountPerPage = recordCountPerPage;
	   }

	   public String getSearchCondition() {
	      return searchCondition;
	   }

	   public void setSearchCondition(String searchCondition) {
	      this.searchCondition = searchCondition;
	   }

	   public String getSearchKeyword() {
	      return searchKeyword;
	   }

	   public void setSearchKeyword(String searchKeyword) {
	      this.searchKeyword = searchKeyword;
	   }

	   public String getSearchUseYn() {
	      return searchUseYn;
	   }

	   public void setSearchUseYn(String searchUseYn) {
	      this.searchUseYn = searchUseYn;
	   }

	   public int getPageIndex() {
	      return pageIndex;
	   }

	   public void setPageIndex(int pageIndex) {
	      this.pageIndex = pageIndex;
	   }

	   public int getPageUnit() {
	      return pageUnit;
	   }

	   public void setPageUnit(int pageUnit) {
	      this.pageUnit = pageUnit;
	   }

	   public int getPageSize() {
	      return pageSize;
	   }

	   public void setPageSize(int pageSize) {
	      this.pageSize = pageSize;
	   }

	   @Override
	   public String toString() {
	      return ToStringBuilder.reflectionToString(this);
	   }

	}