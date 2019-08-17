package com.mapper;

import com.entity.Banner;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BannerMapper {
    Integer addBanner(Banner banner);
    Integer deleteBanner(Integer banner_id);
    Integer changeBannerState(Integer state,Integer banner_id);
    Integer updateBanner(Banner banner);
    Banner findBannerById(Integer banner_id);
    List<Banner> findAllBanner();
    List<Banner> findAllShowBanner();
    List<Banner> findAllBannerByLikeName(String name);
}
