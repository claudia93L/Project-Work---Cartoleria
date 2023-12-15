package pw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/registrazionesuccesso")
public class RegistrazioneSuccessoController {

	@GetMapping
	public String getPage() {
		return "RegistrazioneSuccesso";
	}

}
