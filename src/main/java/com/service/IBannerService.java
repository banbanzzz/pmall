package com.service;

import com.entity.Banner;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface IBannerService {
    List<Banner> findAllShowBanner();
    Integer addBanner(Banner banner);
    Integer updateBanner(Banner banner);
    Integer deleteBanner(Integer banner_id);
    Integer changeBannerState(Integer state,Integer banner_id);
    PageInfo<Banner> findAllBannerBySplitePage(Integer page,Integer limit,String keyword);
}
