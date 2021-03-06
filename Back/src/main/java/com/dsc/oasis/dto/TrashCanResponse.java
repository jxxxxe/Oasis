package com.dsc.oasis.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TrashCanResponse {

    private Long id;

    private Long latitude;

    private Long longitude;
}
