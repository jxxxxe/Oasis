package com.dsc.oasis.trashcan.domain;

import com.dsc.oasis.trashcan.dto.TrashCanResponse;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.*;
import net.minidev.json.annotate.JsonIgnore;
import org.locationtech.jts.geom.Point;

import javax.persistence.*;

@Entity
@Builder
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Table(name= "tb1_tcan")
public class TrashCan {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String address;

    private String location;

    private String trash_type;

    private Double latitude;

    private Double longitude;

    @Transient
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Point point;

    public TrashCanResponse toResponse(){
        return TrashCanResponse.builder().id(id).point(point).build();
    }
}
