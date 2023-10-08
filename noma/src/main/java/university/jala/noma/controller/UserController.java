package university.jala.noma.controller;

import ch.qos.logback.core.boolex.Matcher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import university.jala.noma.model.LoginRequest;
import university.jala.noma.model.User;
import university.jala.noma.model.UserService;

@RestController
public class UserController {
    @Autowired
    private UserService userService;
    private Matcher passwordEncoder;

    @PostMapping("/login")
    public ResponseEntity<String> login(@RequestBody LoginRequest loginRequest) {
        User user = userService.getUserByUsername(loginRequest.getUsername());
        if (user != null && user.getPassword().matches(loginRequest.getPassword())) {
            // El usuario existe y la contraseña coincide
            return ResponseEntity.ok("Login exitoso");
        } else {
            // Usuario no encontrado o contraseña incorrecta
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Credenciales inválidas");
        }
    }
}
