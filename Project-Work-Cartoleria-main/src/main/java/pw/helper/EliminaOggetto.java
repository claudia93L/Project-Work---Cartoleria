package pw.helper;

public class EliminaOggetto {
	
	private int id;
	private String type;
	private String description;
	private String redirect;
	
	public EliminaOggetto(int id, String type, String description, String redirect) {
		this.id = id;
		this.type = type;
		this.description = description;
		this.redirect = redirect;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getRedirect() {
		return redirect;
	}

	public void setRedirect(String redirect) {
		this.redirect = redirect;
	}
}