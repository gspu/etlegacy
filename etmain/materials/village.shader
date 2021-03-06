// village.shader
// generated by ShaderCleaner on Thu Feb  6 12:43:32 2003
//updated by thunder 2017 for ETL
// 5 total shaders (was 3)

textures/village/villwin_c12m_glass
{
	qer_editorimage textures/village/villwin_c12m
	qer_trans 0.7
	cull disable
	surfaceparm glass
	surfaceparm pointlight
	surfaceparm trans
	{
	    stage diffusemap
		map textures/village/villwin_c12m
		//blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		blendfunc blend
		//alphaFunc GE128
		rgbgen vertex
		depthWrite
	}
	{
	   	stage bumpmap
	    map textures/village/villwin_c12m_n
	    //blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		blendfunc blend
		//alphaFunc GE128
		rgbgen vertex
		depthWrite
	}
	{
	   stage specularmap
	   map textures/village/villwin_c12m_s
       //blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		blendfunc blend
		//alphaFunc GE128
		rgbgen vertex
		depthWrite
	}
}

textures/village/villwin_c15
{
	qer_editorimage textures/village/villwin_c15
	diffusemap textures/village/villwin_c15
	specularmap textures/village/villwin_c15_s
	bumpmap textures/village/villwin_c15_n
	q3map_surfacelight 300
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/village/villwin_c15
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/village/villwin_c15.blend
		blendfunc GL_ONE GL_ONE
		rgbGen identity
	}
}

textures/village/villwin_c18
{
	qer_editorimage textures/village/villwin_c18
	diffusemap textures/village/villwin_c18
	specularmap textures/village/villwin_c18_s
	bumpmap textures/village/villwin_c18_n
	q3map_lightsubdivide 128
	q3map_surfacelight 200
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/village/villwin_c18
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/village/villwin_c18.blend
		blendfunc GL_ONE GL_ONE
		rgbGen identity
	}
}

//NEW
textures/village/vill2_win_m2
{
        qer_editorimage textures/village/vill2_win_m2
		diffusemap textures/village/vill2_win_m2
		specularmap textures/village/vill2_win_m2_s
		bumpmap textures/village/vill2_win_m2_n
		surfaceparm glass
	    surfaceparm pointlight
}

textures/village/villwin_c08dm
{
        qer_editorimage textures/village/villwin_c08dm
		diffusemap textures/village/villwin_c08dm
		specularmap textures/village/villwin_c08dm_s
		bumpmap textures/village/villwin_c08dm_n
		surfaceparm glass
	    surfaceparm pointlight
}