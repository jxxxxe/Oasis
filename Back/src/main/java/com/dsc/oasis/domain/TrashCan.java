package com.dsc.oasis.domain;

import lombok.*;
import org.locationtech.jts.geom.Point;

import javax.persistence.*;

@Entity
@Builder
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Table(name="tb1_tcan")
public class TrashCan {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String address;

    private String location;

    private String trashType;

    private Point point;

}
