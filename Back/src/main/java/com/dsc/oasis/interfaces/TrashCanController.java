package com.dsc.oasis.interfaces;

import com.dsc.oasis.application.TrashcanService;
import com.dsc.oasis.domain.TrashCan;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RequiredArgsConstructor
@RestController
public class TrashCanController {

    private TrashcanService trashcanService;

    @GetMapping("/trashcans/{lat},{lon}")
    public List<TrashCan> list(
            @PathVariable("lat") Double lat,
            @PathVariable("lon") Double lon
    ){
        List<TrashCan> trashCans =trashcanService.getNearTCans(lat,lon);

        return trashCans;
    }


}
