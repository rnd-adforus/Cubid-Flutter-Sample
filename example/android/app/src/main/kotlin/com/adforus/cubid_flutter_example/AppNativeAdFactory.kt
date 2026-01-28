package com.adforus.cubid_flutter_example

import com.adforus.cubid_flutter.nativead.CubidNativeAdContext
import com.adforus.cubid_flutter.nativead.CubidNativeAdFactory

class AppNativeAdFactory : CubidNativeAdFactory {

    override fun configure(
        context: CubidNativeAdContext,
        options: Map<String, Any>?
    ) {
        context.layoutResId = R.layout.native_ad_layout
        context.mediaViewId = R.id.native_media
        context.headlineViewId = R.id.native_headline
        context.callToActionViewId = R.id.native_cta
        context.iconViewId = R.id.native_icon
        context.bodyViewId = R.id.native_body
    }
}
