package com.sign.test.vo;

public class Book {

	int id;
	String title;
	String author;
	String image;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	@Override
	public String toString() {
		
		return "Book [ title = "+ title + ", author =" + author+ " , image =" +image+ " ] ";
		 
	}
	
	
}
