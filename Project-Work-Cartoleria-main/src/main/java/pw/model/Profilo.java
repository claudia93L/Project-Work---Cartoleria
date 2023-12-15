package pw.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;

@Entity
@Table(name="profili")
public class Profilo implements Serializable {

	private static final long serialVersionUID = 1807319637849212582L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "username", length = 20, nullable = false)
	@Pattern(regexp = "[a-zA-Z0-9.]{1,20}", message = "{error.charnotallowed}")
	private String username;
	
	@Column(name = "password", length = 20, nullable = false)
	@Pattern(regexp = "[a-zA-Z0-9.@]{1,20}", message = "{error.charnotallowed}")
	private String password;
	
	@OneToOne(mappedBy = "profilo", cascade = CascadeType.REFRESH)
	private Utente utente;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Utente getUtente() {
		return utente;
	}

	public void setUtente(Utente utente) {
		this.utente = utente;
	}

}
