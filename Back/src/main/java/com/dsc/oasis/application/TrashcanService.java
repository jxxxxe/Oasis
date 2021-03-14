package com.dsc.oasis.application;

import com.dsc.oasis.domain.*;
import com.dsc.oasis.dto.TrashCanResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@RequiredArgsConstructor
@Service
public class TrashcanService {

    private final TrashCanRepository tCanRepository;

    private final TrashCanGeometryRepository tCanGeoRepository;

    public List<TrashCan> getTrashCans() {

        List<TrashCan> trashCans=tCanRepository.findAll();

        return trashCans;
    }

    public TrashCan getTrashCanById(Long id) {

        TrashCan trashCan=tCanRepository.findById(id).orElse(null);

        return trashCan;
    }

    public List<TrashCan> getNearTrashCans(Double latitude,Double longitude){
        List<TrashCan> trashCans=tCanGeoRepository.getNearTCans(latitude,longitude);

        return trashCans;
    }

//    public void createTCan() throws ParseException {
//        TrashCan<List>
//
//        for(Double latitude, Double longitude)
//        String pointWKT=String.format("POINT(%s %s)",longitude,latitude);
//
//        Point point=(Point)new WKTReader().read(pointWKT);
//        TrashCan tCan= TrashCan.builder().point(point).build();
//        tCanRepository.save(tCan);
//    }
}
