package com.dsc.oasis.domain;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface TrashCanRepository extends JpaRepository<TrashCan,Long> {
    Optional<TrashCan> findById(Long id);
}
