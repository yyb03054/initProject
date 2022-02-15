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

import org.springframework.web.multipart.MultipartFile;

/**
 * @Class Name : SellVO.java
 * @Description : SellVO Class
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
public class SellVO extends SellDefaultVO {

	 private static final long serialVersionUID = 1L;
	    
	   private String prdNum;
	   
	   private String prdName;
	   
	   private String brdCode;
	   
	   private String brdName;
	   
	   private String imgAddress;

	   private String imgNum;
	   
	   private String mainImg;
	   
	   private String prdPrice;
	   
	   private String grade;
	   
	   private String shopName;
	   
	   private String delPrice;
	   
	   private String delCode;
	   
	   private String delName;

	   private String shopCode;
	   
	   private String overseasDel;
	   
	   private String saleNum;
	   
	    private String saleName;
	   
	   private String salePer;
	   
	   private String saleSdate;
	   
	   private String saleFdate;
	   
	   private String periodCnt;
	   
	   private String ceo;

	   private String prdCnt;
	   
	   private String userName;
	   
	   private String postCode;
	   
	   private String roadAdd;
	   
	   private String detailAdd;
	   
	   private String userEmail;
	   
	   private String userPhone;
	   
	   private String delMessage;
	   
	   private String prdPriceSale;
	   
	   private String totalPrice;
	   
	   private String orderDate;
	   
	   private String orderNum;
	   
	   public String getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}

	public String getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getPrdPriceSale() {
		return prdPriceSale;
	}

	public void setPrdPriceSale(String prdPriceSale) {
		this.prdPriceSale = prdPriceSale;
	}

	public String getPrdCnt() {
		return prdCnt;
	}

	public void setPrdCnt(String prdCnt) {
		this.prdCnt = prdCnt;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPostCode() {
		return postCode;
	}

	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}

	public String getRoadAdd() {
		return roadAdd;
	}

	public void setRoadAdd(String roadAdd) {
		this.roadAdd = roadAdd;
	}

	public String getDetailAdd() {
		return detailAdd;
	}

	public void setDetailAdd(String detailAdd) {
		this.detailAdd = detailAdd;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getDelMessage() {
		return delMessage;
	}

	public void setDelMessage(String delMessage) {
		this.delMessage = delMessage;
	}

	public String getCeo() {
		return ceo;
	}

	public void setCeo(String ceo) {
		this.ceo = ceo;
	}

	public String getShopAdd() {
		return shopAdd;
	}

	public void setShopAdd(String shopAdd) {
		this.shopAdd = shopAdd;
	}

	private String shopAdd;
	   
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
	   
	   public String getSaleName() {
		return saleName;
	}

	public void setSaleName(String saleName) {
		this.saleName = saleName;
	}

	public String getSalePer() {
		return salePer;
	}

	public void setSalePer(String salePer) {
		this.salePer = salePer;
	}

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

	private MultipartFile uploadFile;
	   
	   public String getImgNum() {
	      return imgNum;
	   }

	   public void setImgNum(String imgNum) {
	      this.imgNum = imgNum;
	   }

	   public String getMainImg() {
	      return mainImg;
	   }

	   public void setMainImg(String mainImg) {
	      this.mainImg = mainImg;
	   }
	   
	   public MultipartFile getUploadFile() {
	      return uploadFile;
	   }

	   public void setUploadFile(MultipartFile uploadFile) {
	      this.uploadFile = uploadFile;
	   }

	   public String getOverseasDel() {
	      return overseasDel;
	   }

	   public void setOverseasDel(String overseasDel) {
	      this.overseasDel = overseasDel;
	   }

	   public String getDelName() {
	      return delName;
	   }

	   public void setDelName(String delName) {
	      this.delName = delName;
	   }
	   
	   public String getDelCode() {
	      return delCode;
	   }

	   public void setDelCode(String delCode) {
	      this.delCode = delCode;
	   }

	   public String getShopCode() {
	      return shopCode;
	   }

	   public void setShopCode(String shopCode) {
	      this.shopCode = shopCode;
	   }

	   public String getDelPrice() {
	      return delPrice;
	   }

	   public void setDelPrice(String delPrice) {
	      this.delPrice = delPrice;
	   }

	   public String getPrdNum() {
	      return prdNum;
	   }

	   public void setPrdNum(String prdNum) {
	      this.prdNum = prdNum;
	   }

	   public String getPrdName() {
	      return prdName;
	   }

	   public void setPrdName(String prdName) {
	      this.prdName = prdName;
	   }

	   public String getBrdCode() {
	      return brdCode;
	   }

	   public void setBrdCode(String brdCode) {
	      this.brdCode = brdCode;
	   }

	   public String getBrdName() {
	      return brdName;
	   }

	   public void setBrdName(String brdName) {
	      this.brdName = brdName;
	   }

	   public String getImgAddress() {
	      return imgAddress;
	   }

	   public void setImgAddress(String imgAddress) {
	      this.imgAddress = imgAddress;
	   }

	   public String getPrdPrice() {
	      return prdPrice;
	   }

	   public void setPrdPrice(String prdPrice) {
	      this.prdPrice = prdPrice;
	   }

	   public String getGrade() {
	      return grade;
	   }

	   public void setGrade(String grade) {
	      this.grade = grade;
	   }
	   
	   public String getShopName() {
	      return shopName;
	   }

	   public void setShopName(String shopName) {
	      this.shopName = shopName;
	   }
	   
	   /** 아이디 */
	   private String id;

	   /** 이름 */
	   private String name;

	   /** 내용 */
	   private String description;

	   /** 사용여부 */
	   private String useYn;

	   /** 등록자 */
	   private String regUser;

	   public String getId() {
	      return id;
	   }

	   public void setId(String id) {
	      this.id = id;
	   }

	   public String getName() {
	      return name;
	   }

	   public void setName(String name) {
	      this.name = name;
	   }

	   public String getDescription() {
	      return description;
	   }

	   public void setDescription(String description) {
	      this.description = description;
	   }

	   public String getUseYn() {
	      return useYn;
	   }

	   public void setUseYn(String useYn) {
	      this.useYn = useYn;
	   }

	   public String getRegUser() {
	      return regUser;
	   }

	   public void setRegUser(String regUser) {
	      this.regUser = regUser;
	   }

	}
