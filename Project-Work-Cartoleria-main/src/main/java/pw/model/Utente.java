	package pw.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.Valid;
import javax.validation.constraints.Pattern;

@Entity
@Table(name = "utenti")
public class Utente implements Serializable {

	private static final long serialVersionUID = 245554236254718428L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "nome", length = 50, nullable = false)
	@Pattern(regexp = "[a-zA-Z\\s]{1,50}", message = "{error.charnotallowed}")
	private String nome;
	
	@Column(name = "cognome", length = 50, nullable = false)
	@Pattern(regexp = "[a-zA-Z\\s']{1,50}", message = "{error.charnotallowed}")
	private String cognome;
	
	@Column(name = "indirizzo", length = 50, nullable = false)
	@Pattern(regexp = "[a-zA-Z0-9\\s']{1,50}", message = "{error.charnotallowed}")
	private String indirizzo;
	
	@Column(name = "citta", length = 50, nullable = false)
	@Pattern(regexp = "[a-zA-Z\\s']{1,50}", message = "{error.charnotallowed}")
	private String citta;
	
	@Column(name = "regione", length = 50, nullable = false)
	@Pattern(regexp = "[a-zA-Z0-9\\s]{1,50}", message = "{error.charnotallowed}")
	private String regione;
	
	@Column(name = "cap", length = 5, nullable = false)
	@Pattern(regexp = "[0-9\\s]{1,5}", message = "{error.charnotallowed}")
	private String cap;
	
	@Column(name = "provincia", length = 2, nullable = false)
	@Pattern(regexp = "[a-zA-Z\\s]{1,2}", message = "{error.charnotallowed}")
	private String provincia;
	
	@Column(name = "email", length = 50, nullable = false)
	@Pattern(regexp = "[a-zA-Z\\s'@-_.]{1,50}", message = "{error.charnotallowed}")
	private String email;
	
	@Column(name = "telefono", length = 50, nullable = false)
	@Pattern(regexp = "[0-9\\s]{1,50}", message = "{error.charnotallowed}")
	private String telefono;
	
	@Valid
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "id_profilo", referencedColumnName = "id")
	private Profilo profilo;
	
	@OneToMany(mappedBy = "utente", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.EAGER)
	private List<Ordine> listaOrdini = new ArrayList<>();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public String getIndirizzo() {
		return indirizzo;
	}

	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}

	public String getCitta() {
		return citta;
	}

	public void setCitta(String citta) {
		this.citta = citta;
	}

	public String getCap() {
		return cap;
	}

	public void setCap(String cap) {
		this.cap = cap;
	}

	public String getProvincia() {
		return provincia;
	}

	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public Profilo getProfilo() {
		return profilo;
	}

	public void setProfilo(Profilo profilo) {
		this.profilo = profilo;
	}
	
	public List<Ordine> getListaOrdini() {
		return listaOrdini;
	}

	public void setListaOrdini(List<Ordine> listaOrdini) {
		this.listaOrdini = listaOrdini;
	}

	public String getRegione() {
		return regione;
	}

	public void setRegione(String regione) {
		this.regione = regione;
	}
	
}
