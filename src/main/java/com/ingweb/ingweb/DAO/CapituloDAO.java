package com.ingweb.ingweb.DAO;

import com.ingweb.ingweb.models.Capitulo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;
import java.util.List;

@Repository
@Transactional
public interface CapituloDAO {
    Capitulo getCapitulo(Long mangaid, Long capid);
    List<Capitulo> getCapitulos(Long mangaid);
    void subirCapitulo(Capitulo aux, List<MultipartFile> paginas) throws IOException;

}
