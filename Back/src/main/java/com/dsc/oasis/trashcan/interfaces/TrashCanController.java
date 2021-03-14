package com.dsc.oasis.trashcan.interfaces;

import com.dsc.oasis.trashcan.application.TrashcanService;
import com.dsc.oasis.trashcan.domain.TrashCan;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequiredArgsConstructor
@RestController
@RequestMapping(path = "api/oasis")
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
