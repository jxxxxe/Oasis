package com.dsc.oasis.dto;

import com.dsc.oasis.domain.Location;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TrashCanRequest {

    private Double latitude;

    private Double longitude;

    public Location toEntity(){
        return Location.builder()
                .latitude(latitude)
                .longitude(longitude)
                .build();
    }
}
