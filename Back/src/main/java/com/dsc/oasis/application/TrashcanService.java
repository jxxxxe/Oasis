package com.dsc.oasis.application;

import com.dsc.oasis.domain.*;
import lombok.RequiredArgsConstructor;
import org.locationtech.jts.geom.Point;
import org.locationtech.jts.io.ParseException;
import org.locationtech.jts.io.WKTReader;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.List;

@RequiredArgsConstructor
@Service
public class TrashcanService {

    private TrashCanRepository tCanRepository;

    private final EntityManager entityManager;

    public List<TrashCan> getNearTCans(Double baseLatitude, Double baseLongitude){
        double distance=0.5;

        //북동쪽 좌표 구하기
        Location northEast= GeometryUtils.calculate(baseLatitude,baseLongitude,
                distance, Direction.NORTHEAST.getBearing());

        //남서쪽 좌표 구하기
        Location southWest=GeometryUtils.calculate(baseLatitude,baseLongitude,
                distance,Direction.SOUTHWEST.getBearing());

        double x1=northEast.getLatitude();
        double y1= northEast.getLongitude();
        double x2= northEast.getLatitude();
        double y2= northEast.getLongitude();

        String pointFormat=String.format("'LINESTRING(%f %f, %f %f)')",x1,y1,x2,y2);
        Query query=entityManager.createNativeQuery("SELECT t.id, t.address, t.location,t.trashType \n"
                    +"FROM trashcan AS t \n"
                    +"WHERE MBRContains(ST_LINESTRINGFROMTEXT("+pointFormat+",t.point)",TrashCan.class)
                .setMaxResults(10);

        List<TrashCan> trashCans= query.getResultList();

        return trashCans;
    }

    public void createTCan(Double latitude, Double longitude) throws ParseException {
        String pointWKT=String.format("POINT(%s %s)",longitude,latitude);

        Point point=(Point)new WKTReader().read(pointWKT);
        TrashCan tCan= TrashCan.builder().point(point).build();
        tCanRepository.save(tCan);
    }
}
