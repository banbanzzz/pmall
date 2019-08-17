package com.service.imp;

import com.entity.Banner;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mapper.BannerMapper;
import com.service.IBannerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class BannerServiceImp implements IBannerService {
    @Autowired
    private BannerMapper bannerMapper;

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public List<Banner> findAllShowBanner() {
        return bannerMapper.findAllShowBanner();
    }

    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    @Override
    public Integer addBanner(Banner banner) {
        return bannerMapper.addBanner(banner);
    }

    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    @Override
    public Integer updateBanner(Banner banner) {
        return bannerMapper.updateBanner(banner);
    }

    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    @Override
    public Integer deleteBanner(Integer banner_id) {
        return bannerMapper.deleteBanner(banner_id);
    }

    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    @Override
    public Integer changeBannerState(Integer state, Integer banner_id) {
        return bannerMapper.changeBannerState(state,banner_id);
    }

    @Transactional(propagation = Propagation.REQUIRED,readOnly = true)
    @Override
    public PageInfo<Banner> findAllBannerBySplitePage(Integer page, Integer limit, String keyword) {
        PageHelper.startPage(page,limit);
        List<Banner> list = new ArrayList<Banner>();
        if(keyword != null && !keyword.equals("")){
            list = bannerMapper.findAllBannerByLikeName(keyword);
        }else {
            list = bannerMapper.findAllBanner();
        }
        PageInfo<Banner> info = new PageInfo<Banner>(list);
        return info;
    }
}
