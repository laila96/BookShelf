package dao;



public class Sell {
	
	private Long idSell;
	private String name,author,description,prix;
	
	
	
	
	
	public Sell(Long id2, String name2, String author, String des, String prix ) {
		// TODO Auto-generated constructor stub
		this.idSell = id2;
		this.name = name2;
		this.author = author;
		this.description = des;
		this.prix = prix;
	}

	public Long getIdSell() {
		return idSell;
	}

	public void setIdSell(Long idSell) {
		this.idSell = idSell;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPrix() {
		return prix;
	}

	public void setPrix(String prix) {
		this.prix = prix;
	}

	public Sell() {
		
	}

	

}

