package com.ingweb.ingweb.controllers;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.multipart.MaxUploadSizeExceededException;

@ControllerAdvice
public class AdvertenciasController {
    @ExceptionHandler(MaxUploadSizeExceededException.class)
    public ResponseEntity<String> pesoExcedido(MaxUploadSizeExceededException e){
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("El tamaño del archivo es mayor a 50 MB");
    }
}
