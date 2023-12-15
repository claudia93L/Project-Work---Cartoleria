package pw.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Pattern;

@Entity
@Table(name = "prodotti")
public class Prodotto implements Serializable {

	private static final long serialVersionUID = 2847814773929825612L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "nome_prodotto", length = 50, nullable = false)
	@Pattern(regexp = "[a-zA-Z0-9\\s']{1,50}", message = "{error.charnotallowed}")
	private String nomeProdotto;
	
	@Column(name = "descrizione", length = 50, nullable = false)
	@Pattern(regexp = "[a-zA-Z0-9\\s']{1,50}", message = "{error.charnotallowed}")
	private String descrizione;
	
	@Column(name = "quantita", nullable = false)
	@Digits(integer = 4, fraction = 0, message = "{error.invalidamount}")
	private int quantita;
	
	@Column(name = "prezzo_di_vendita", nullable = false)
	@Digits(integer = 4, fraction = 2, message = "{error.invalidamount}")
	private double prezzo;
	
	@Column(name = "codice_prodotto", length = 20, nullable = false)
	@Pattern(regexp = "[0-9\\s]{1,20}", message = "{error.charnotallowed}")
	private String codiceProdotto;
	
	@ManyToOne(cascade = CascadeType.REFRESH)
	@JoinColumn(name = "id_categoria", referencedColumnName = "id")
	private Categoria categoriaProdotto;
	
	@Override
	public String toString() {
		return nomeProdotto;
	}

	@Transient
	private boolean included;
	
	@Transient
	private boolean image;
	
	public void setImage(boolean image) {
		this.image = image;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNomeProdotto() {
		return nomeProdotto;
	}

	public void setNomeProdotto(String nomeProdotto) {
		this.nomeProdotto = nomeProdotto;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	public int getQuantita() {
		return quantita;
	}

	public void setQuantita(int quantita) {
		this.quantita = quantita;
	}

	public double getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}

	public String getCodiceProdotto() {
		return codiceProdotto;
	}

	public void setCodiceProdotto(String codiceProdotto) {
		this.codiceProdotto = codiceProdotto;
	}

	public Categoria getCategoriaProdotto() {
		return categoriaProdotto;
	}

	public void setCategoriaProdotto(Categoria categoriaProdotto) {
		this.categoriaProdotto = categoriaProdotto;
	}
	
	public boolean isIncluded() {
		return included;
	}

	public void setIncluded(boolean included) {
		this.included = included;
	}

	public boolean isImage() {
		return image;
	}

}
