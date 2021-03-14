package com.dsc.oasis.interfaces;

import com.dsc.oasis.application.TrashcanService;
import com.dsc.oasis.domain.TrashCan;
import com.dsc.oasis.dto.TrashCanResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RequiredArgsConstructor
@RestController
public class TrashCanController {

    private final TrashcanService trashcanService;

//    @GetMapping("/trashcans")
//    public List<TrashCan> listAll(){
//        List<TrashCan> trashCans=trashcanService.getTrashCans();
//
//        return trashCans;
//    }

    @GetMapping("/trashcans/{id}")
    public TrashCan listAll(
            @PathVariable("id") Long id
    ){
        TrashCan trashCan=trashcanService.getTrashCanById(id);

        return trashCan;
    }

    @GetMapping("/trashcans")
    public List<TrashCan> list(
            @RequestParam("lat") Double lat,
            @RequestParam("lon") Double lon
    ){
        List<TrashCan> trashCans =trashcanService.getNearTrashCans(lat,lon);

        return trashCans;
    }


}
