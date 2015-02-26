package net.xieee.web.controller;

import net.xieee.web.service.impl.PictureServiceImpl;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

public class PictureController {
	private final static Logger LOGGER = Logger.getLogger(PictureController.class);
	@Autowired
	private PictureServiceImpl pictureServiceImpl;
}
