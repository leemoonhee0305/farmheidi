package com.spring.farm.product.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.farm.product.ProductVO;


@Repository
public class ProductDAOMybatis {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//상품 전체 목록 조회
	public List<ProductVO> getProductList(ProductVO vo) {
		return mybatis.selectList("ProductDAO.getProductList", vo);
	}
	
	//상품 상세보기
	public ProductVO getProductDetail(ProductVO vo) {
		return mybatis.selectOne("ProductDAO.getProductDetail", vo);
	}

	public int countProduct(ProductVO vo) {
		return mybatis.selectOne("ProductDAO.countProduct", vo);
	}
	
	public int delSelProd(ProductVO vo) {
		return mybatis.delete("ProductDAO.delSelProd", vo);
	}

	public void stop(ProductVO vo) {
		mybatis.update("ProductDAO.stop", vo);
	}

	public ProductVO upProdsel(ProductVO vo) {
		return mybatis.selectOne("ProductDAO.getProductDetail", vo);
	}

	public void insertProd(ProductVO vo) {
		mybatis.insert("ProductDAO.insertProd", vo);		
	}

	public void updateProd(ProductVO vo) {
		mybatis.update("ProductDAO.updateProd", vo);	
	}
	
	public int delProduct(ProductVO vo) {
		return mybatis.delete("ProductDAO.delProduct", vo);
	}
	
	public int orderHistoryCnt(int pro_num) {
		return mybatis.selectOne("ProductDAO.orderHistoryCnt", pro_num);
	}
	
	public ProductVO getFileName(ProductVO vo) {
		return mybatis.selectOne("ProductDAO.getFileName", vo);
	}
	
	public List<ProductVO> getProductListDESC() {
	    return mybatis.selectList("ProductDAO.getProductListDESC");
	}
	 
}
