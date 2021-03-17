package com.dsc.oasis.trashcan.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.locationtech.jts.geom.Point;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TrashCanResponse {

    private Long id;

    private String address;

    private String location;

    private String trash_type;

    private Double latitude;

    private Double longitude;

    private Integer distance;

}
