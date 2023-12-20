package com.spring.farm.product.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.farm.product.ProductService;
import com.spring.farm.product.ProductVO;

@Service("productService")
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProductDAOMybatis productDAO;

	@Override
	public List<ProductVO> getProductList(ProductVO vo) {
		return productDAO.getProductList(vo);
	}

	@Override
	public ProductVO getProductDetail(ProductVO vo) {
		return productDAO.getProductDetail(vo);
	}

	@Override
	public int countProduct(ProductVO vo) {
		return productDAO.countProduct(vo);
	}
	
	@Override
	public int delSelProd(ProductVO vo) {
		return productDAO.delSelProd(vo);
	}

	@Override
	public void stop(ProductVO vo) {
		productDAO.stop(vo);
	}
	
	@Override
	public ProductVO upProdsel(ProductVO vo) {
		return productDAO.upProdsel(vo);
	}

	@Override
	public void insertProd(ProductVO vo) {
		productDAO.insertProd(vo);		
	}

	@Override
	public void updateProd(ProductVO vo) {
		productDAO.updateProd(vo);
	}
	
	@Override
	public int delProduct(ProductVO vo) {
		return productDAO.delProduct(vo);
	}
	
	@Override
	public int orderHistoryCnt(int pro_num) {
		return productDAO.orderHistoryCnt(pro_num);
	}

	@Override
	public ProductVO getFileName(ProductVO vo) {
		return productDAO.getFileName(vo);
	}
	@Override
	public List<ProductVO> getProductListDESC() {
	    return productDAO.getProductListDESC();
	   }

}
