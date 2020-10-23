package kr.co.shoestore.domain;

public class Basket {
	
	private int sno;
	private String id;
	private String shoesname;
	private String brand;
	private String image;
	private String price;
	
	
	
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getShoesname() {
		return shoesname;
	}
	public void setShoesname(String shoesname) {
		this.shoesname = shoesname;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}
