import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_inappwebview_web/src/types/user_preferred_content_mode.dart';
import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import '../types/action_mode_menu_item.dart';
import '../types/cache_mode.dart';
import '../types/data_detector_types.dart';
import '../types/force_dark.dart';
import '../types/force_dark_strategy.dart';
import '../types/layout_algorithm.dart';
import '../types/mixed_content_mode.dart';
import '../types/over_scroll_mode.dart';
import '../types/referrer_policy.dart';
import '../types/renderer_priority_policy.dart';
import '../types/requested_with_header_mode.dart';
import '../types/sandbox.dart';
import '../types/scrollbar_style.dart';
import '../types/scrollview_content_inset_adjustment_behavior.dart';
import '../types/scrollview_deceleration_rate.dart';
import '../types/selection_granularity.dart';
import '../types/vertical_scrollbar_position.dart';
import 'android/in_app_webview_options.dart';
import 'apple/in_app_webview_options.dart';
import '../content_blocker.dart';
import '../types/main.dart';
import '../util.dart';
import '../in_app_browser/in_app_browser_settings.dart';
import 'webview.dart';
import '../android/webview_feature.dart';
import '../in_app_webview/in_app_webview_controller.dart';
import '../context_menu.dart';

part 'in_app_webview_settings.g.dart';

List<ContentBlocker> _deserializeContentBlockers(
    List<dynamic>? contentBlockersMapList) {
  List<ContentBlocker> contentBlockers = [];
  if (contentBlockersMapList != null) {
    contentBlockersMapList.forEach((contentBlocker) {
      contentBlockers.add(ContentBlocker.fromMap(
          Map<dynamic, Map<dynamic, dynamic>>.from(
              Map<dynamic, dynamic>.from(contentBlocker))));
    });
  }
  return contentBlockers;
}

///This class represents all the WebView settings available.
@ExchangeableObject(copyMethod: true)
class InAppWebViewSettings_ {
  ///Set to `true` to be able to listen at the [WebView.shouldOverrideUrlLoading] event. The default value is `false`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  ///- iOS
  ///- MacOS
  bool? useShouldOverrideUrlLoading;

  ///Set to `true` to be able to listen at the [WebView.onLoadResource] event. The default value is `false`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  ///- iOS
  ///- MacOS
  bool? useOnLoadResource;

  ///Set to `true` to be able to listen at the [WebView.onDownloadStartRequest] event. The default value is `false`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  ///- iOS
  ///- MacOS
  bool? useOnDownloadStart;

  ///Set to `true` to have all the browser's cache cleared before the new WebView is opened. The default value is `false`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  ///- iOS
  ///- MacOS
  bool? clearCache;

  ///Sets the user-agent for the WebView.
  ///
  ///**NOTE**: available on iOS 9.0+.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  ///- iOS
  ///- MacOS
  String? userAgent;

  ///Append to the existing user-agent. Setting userAgent will override this.
  ///
  ///**NOTE**: available on Android 17+ and on iOS 9.0+.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  ///- iOS
  ///- MacOS
  String? applicationNameForUserAgent;

  ///Set to `true` to enable JavaScript. The default value is `true`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  ///- iOS
  ///- Web
  ///- MacOS
  bool? javaScriptEnabled;

  ///Set to `true` to allow JavaScript open windows without user interaction. The default value is `false`.
  ///
  ///**NOTE for Web**: this setting will have effect only if the iframe has the same origin.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  ///- iOS
  ///- Web
  ///- MacOS
  bool? javaScriptCanOpenWindowsAutomatically;

  ///Set to `true` to prevent HTML5 audio or video from autoplaying. The default value is `true`.
  ///
  ///**NOTE for iOS**: available on iOS 10.0+.
  ///
  ///**NOTE for MacOS**: available on MacOS 10.12+.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  ///- iOS
  ///- MacOS
  bool? mediaPlaybackRequiresUserGesture;

  ///Sets the minimum font size. The default value is `8` for Android, `0` for iOS.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  ///- iOS
  ///- MacOS
  int? minimumFontSize;

  ///Define whether the vertical scrollbar should be drawn or not. The default value is `true`.
  ///
  ///**NOTE for Web**: this setting will have effect only if the iframe has the same origin.
  ///It must have the same value of [horizontalScrollBarEnabled] to take effect.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  ///- iOS
  ///- Web
  bool? verticalScrollBarEnabled;

  ///Define whether the horizontal scrollbar should be drawn or not. The default value is `true`.
  ///
  ///**NOTE for Web**: this setting will have effect only if the iframe has the same origin.
  ///It must have the same value of [verticalScrollBarEnabled] to take effect.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  ///- iOS
  ///- Web
  bool? horizontalScrollBarEnabled;

  ///List of custom schemes that the WebView must handle. Use the [WebView.onLoadResourceWithCustomScheme] event to intercept resource requests with custom scheme.
  ///
  ///**NOTE for iOS**: available on iOS 11.0+.
  ///
  ///**NOTE for MacOS**: available on MacOS 10.13+.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  ///- iOS
  ///- MacOS
  List<String>? resourceCustomSchemes;

  ///List of [ContentBlocker] that are a set of rules used to block content in the browser window.
  ///
  ///**NOTE for iOS**: available on iOS 11.0+.
  ///
  ///**NOTE for MacOS**: available on MacOS 10.13+.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  ///- iOS
  ///- MacOS
  @ExchangeableObjectProperty(deserializer: _deserializeContentBlockers)
  List<ContentBlocker>? contentBlockers;

  ///Sets the content mode that the WebView needs to use when loading and rendering a webpage. The default value is [UserPreferredContentMode.RECOMMENDED].
  ///
  ///**NOTE for iOS**: available on iOS 13.0+.
  ///
  ///**NOTE for MacOS**: available on MacOS 10.15+.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  ///- iOS
  ///- MacOS
  UserPreferredContentMode_? preferredContentMode;

  ///Set to `true` to be able to listen at the [WebView.shouldInterceptAjaxRequest] event. The default value is `false`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  ///- iOS
  ///- MacOS
  bool? useShouldInterceptAjaxRequest;

  ///Set to `true` to be able to listen at the [WebView.shouldInterceptFetchRequest] event. The default value is `false`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  ///- iOS
  ///- MacOS
  bool? useShouldInterceptFetchRequest;

  ///Set to `true` to open a browser window with incognito mode. The default value is `false`.
  ///
  ///**NOTE for iOS**: available on iOS 9.0+.
  ///
  ///**NOTE for Android**: setting this to `true`, it will clear all the cookies of all WebView instances,
  ///because there isn't any way to make the website data store non-persistent for the specific WebView instance such as on iOS.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  ///- iOS
  ///- MacOS
  bool? incognito;

  ///Sets whether WebView should use browser caching. The default value is `true`.
  ///
  ///**NOTE for iOS**: available on iOS 9.0+.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  ///- iOS
  ///- MacOS
  bool? cacheEnabled;

  ///Set to `true` to make the background of the WebView transparent. If your app has a dark theme, this can prevent a white flash on initialization. The default value is `false`.
  ///
  ///**NOTE for MacOS**: available on MacOS 12.0+.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  ///- iOS
  ///- MacOS
  bool? transparentBackground;

  ///Set to `true` to disable vertical scroll. The default value is `false`.
  ///
  ///**NOTE for Web**: this setting will have effect only if the iframe has the same origin.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  ///- iOS
  ///- Web
  bool? disableVerticalScroll;

  ///Set to `true` to disable horizontal scroll. The default value is `false`.
  ///
  ///**NOTE for Web**: this setting will have effect only if the iframe has the same origin.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  ///- iOS
  ///- Web
  bool? disableHorizontalScroll;

  ///Set to `true` to disable context menu. The default value is `false`.
  ///
  ///**NOTE for Web**: this setting will have effect only if the iframe has the same origin.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  ///- iOS
  ///- Web
  bool? disableContextMenu;

  ///Set to `false` if the WebView should not support zooming using its on-screen zoom controls and gestures. The default value is `true`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  ///- iOS
  ///- MacOS
  bool? supportZoom;

  ///Sets whether cross-origin requests in the context of a file scheme URL should be allowed to access content from other file scheme URLs.
  ///Note that some accesses such as image HTML elements don't follow same-origin rules and aren't affected by this setting.
  ///
  ///Don't enable this setting if you open files that may be created or altered by external sources.
  ///Enabling this setting allows malicious scripts loaded in a `file://` context to access arbitrary local files including WebView cookies and app private data.
  ///
  ///Note that the value of this setting is ignored if the value of [allowUniversalAccessFromFileURLs] is `true`.
  ///
  ///The default value is `false`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  ///- iOS
  ///- MacOS
  bool? allowFileAccessFromFileURLs;

  ///Sets whether cross-origin requests in the context of a file scheme URL should be allowed to access content from any origin.
  ///This includes access to content from other file scheme URLs or web contexts.
  ///Note that some access such as image HTML elements doesn't follow same-origin rules and isn't affected by this setting.
  ///
  ///Don't enable this setting if you open files that may be created or altered by external sources.
  ///Enabling this setting allows malicious scripts loaded in a `file://` context to launch cross-site scripting attacks,
  ///either accessing arbitrary local files including WebView cookies, app private data or even credentials used on arbitrary web sites.
  ///
  ///The default value is `false`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  ///- iOS
  ///- MacOS
  bool? allowUniversalAccessFromFileURLs;

  ///Sets the text zoom of the page in percent. The default value is `100`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  int? textZoom;

  ///Set to `true` to have the session cookie cache cleared before the new window is opened.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  bool? clearSessionCache;

  ///Set to `true` if the WebView should use its built-in zoom mechanisms. The default value is `true`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  bool? builtInZoomControls;

  ///Set to `true` if the WebView should display on-screen zoom controls when using the built-in zoom mechanisms. The default value is `false`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  bool? displayZoomControls;

  ///Set to `true` if you want the database storage API is enabled. The default value is `true`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  bool? databaseEnabled;

  ///Set to `true` if you want the DOM storage API is enabled. The default value is `true`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  bool? domStorageEnabled;

  ///Set to `true` if the WebView should enable support for the "viewport" HTML meta tag or should use a wide viewport.
  ///When the value of the setting is false, the layout width is always set to the width of the WebView control in device-independent (CSS) pixels.
  ///When the value is true and the page contains the viewport meta tag, the value of the width specified in the tag is used.
  ///If the page does not contain the tag or does not provide a width, then a wide viewport will be used. The default value is `true`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  bool? useWideViewPort;

  ///Sets whether Safe Browsing is enabled. Safe Browsing allows WebView to protect against malware and phishing attacks by verifying the links.
  ///Safe Browsing is enabled by default for devices which support it.
  ///
  ///**NOTE**: available on Android 26+.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  bool? safeBrowsingEnabled;

  ///Configures the WebView's behavior when a secure origin attempts to load a resource from an insecure origin.
  ///
  ///**NOTE**: available on Android 21+.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  MixedContentMode_? mixedContentMode;

  ///Enables or disables content URL access within WebView. Content URL access allows WebView to load content from a content provider installed in the system. The default value is `true`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  bool? allowContentAccess;

  ///Enables or disables file access within WebView. Note that this enables or disables file system access only.
  ///Assets and resources are still accessible using `file:///android_asset` and `file:///android_res`. The default value is `true`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  bool? allowFileAccess;

  ///Sets the path to the Application Caches files. In order for the Application Caches API to be enabled, this option must be set a path to which the application can write.
  ///This option is used one time: repeated calls are ignored.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  String? appCachePath;

  ///Sets whether the WebView should not load image resources from the network (resources accessed via http and https URI schemes). The default value is `false`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  bool? blockNetworkImage;

  ///Sets whether the WebView should not load resources from the network. The default value is `false`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  bool? blockNetworkLoads;

  ///Overrides the way the cache is used. The way the cache is used is based on the navigation type. For a normal page load, the cache is checked and content is re-validated as needed.
  ///When navigating back, content is not revalidated, instead the content is just retrieved from the cache. The default value is [CacheMode.LOAD_DEFAULT].
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  CacheMode_? cacheMode;

  ///Sets the cursive font family name. The default value is `"cursive"`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  String? cursiveFontFamily;

  ///Sets the default fixed font size. The default value is `16`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  int? defaultFixedFontSize;

  ///Sets the default font size. The default value is `16`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  int? defaultFontSize;

  ///Sets the default text encoding name to use when decoding html pages. The default value is `"UTF-8"`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  String? defaultTextEncodingName;

  ///Disables the action mode menu items according to menuItems flag.
  ///
  ///**NOTE**: available on Android 24+.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  ActionModeMenuItem_? disabledActionModeMenuItems;

  ///Sets the fantasy font family name. The default value is `"fantasy"`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  String? fantasyFontFamily;

  ///Sets the fixed font family name. The default value is `"monospace"`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  String? fixedFontFamily;

  ///Set the force dark mode for this WebView. The default value is [ForceDark.OFF].
  ///
  ///**NOTE**: available on Android 29+.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  ForceDark_? forceDark;

  ///Set how WebView content should be darkened.
  ///The default value is [ForceDarkStrategy.PREFER_WEB_THEME_OVER_USER_AGENT_DARKENING].
  ///
  ///**NOTE on Android**: it will take effect only if [WebViewFeature.isFeatureSupported] returns `true` for [WebViewFeature.FORCE_DARK_STRATEGY].
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  ForceDarkStrategy_? forceDarkStrategy;

  ///Sets whether Geolocation API is enabled. The default value is `true`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  bool? geolocationEnabled;

  ///Sets the underlying layout algorithm. This will cause a re-layout of the WebView.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  LayoutAlgorithm_? layoutAlgorithm;

  ///Sets whether the WebView loads pages in overview mode, that is, zooms out the content to fit on screen by width.
  ///This setting is taken into account when the content width is greater than the width of the WebView control, for example, when [useWideViewPort] is enabled.
  ///The default value is `false`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  bool? loadWithOverviewMode;

  ///Sets whether the WebView should load image resources. Note that this method controls loading of all images, including those embedded using the data URI scheme.
  ///Note that if the value of this setting is changed from false to true, all images resources referenced by content currently displayed by the WebView are loaded automatically.
  ///The default value is `true`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  bool? loadsImagesAutomatically;

  ///Sets the minimum logical font size. The default is `8`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  int? minimumLogicalFontSize;

  ///Sets the initial scale for this WebView. 0 means default. The behavior for the default scale depends on the state of [useWideViewPort] and [loadWithOverviewMode].
  ///If the content fits into the WebView control by width, then the zoom is set to 100%. For wide content, the behavior depends on the state of [loadWithOverviewMode].
  ///If its value is true, the content will be zoomed out to be fit by width into the WebView control, otherwise not.
  ///If initial scale is greater than 0, WebView starts with this value as initial scale.
  ///Please note that unlike the scale properties in the viewport meta tag, this method doesn't take the screen density into account.
  ///The default is `0`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  int? initialScale;

  ///Tells the WebView whether it needs to set a node. The default value is `true`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  bool? needInitialFocus;

  ///Sets whether this WebView should raster tiles when it is offscreen but attached to a window.
  ///Turning this on can avoid rendering artifacts when animating an offscreen WebView on-screen.
  ///Offscreen WebViews in this mode use more memory. The default value is `false`.
  ///
  ///**NOTE**: available on Android 23+.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  bool? offscreenPreRaster;

  ///Sets the sans-serif font family name. The default value is `"sans-serif"`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  String? sansSerifFontFamily;

  ///Sets the serif font family name. The default value is `"sans-serif"`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  String? serifFontFamily;

  ///Sets the standard font family name. The default value is `"sans-serif"`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  String? standardFontFamily;

  ///Sets whether the WebView should save form data. In Android O, the platform has implemented a fully functional Autofill feature to store form data.
  ///Therefore, the Webview form data save feature is disabled. Note that the feature will continue to be supported on older versions of Android as before.
  ///The default value is `true`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  bool? saveFormData;

  ///Boolean value to enable third party cookies in the WebView.
  ///Used on Android Lollipop and above only as third party cookies are enabled by default on Android Kitkat and below and on iOS.
  ///The default value is `true`.
  ///
  ///**NOTE**: available on Android 21+.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  bool? thirdPartyCookiesEnabled;

  ///Boolean value to enable Hardware Acceleration in the WebView.
  ///The default value is `true`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  bool? hardwareAcceleration;

  ///Sets whether the WebView supports multiple windows.
  ///If set to `true`, [WebView.onCreateWindow] event must be implemented by the host application. The default value is `false`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  bool? supportMultipleWindows;

  ///Regular expression used by [WebView.shouldOverrideUrlLoading] event to cancel navigation requests for frames that are not the main frame.
  ///If the url request of a subframe matches the regular expression, then the request of that subframe is canceled.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  String? regexToCancelSubFramesLoading;

  ///Set to `false` to disable Flutter Hybrid Composition. The default value is `true`.
  ///Hybrid Composition is supported starting with Flutter v1.20+.
  ///
  ///**NOTE**: It is recommended to use Hybrid Composition only on Android 10+ for a release app,
  ///as it can cause framerate drops on animations in Android 9 and lower (see [Hybrid-Composition#performance](https://github.com/flutter/flutter/wiki/Hybrid-Composition#performance)).
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  bool? useHybridComposition;

  ///Set to `true` to be able to listen at the [WebView.shouldInterceptRequest] event. The default value is `false`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  bool? useShouldInterceptRequest;

  ///Set to `true` to be able to listen at the [WebView.onRenderProcessGone] event. The default value is `false`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  bool? useOnRenderProcessGone;

  ///Sets the WebView's over-scroll mode.
  ///Setting the over-scroll mode of a WebView will have an effect only if the WebView is capable of scrolling.
  ///The default value is [OverScrollMode.IF_CONTENT_SCROLLS].
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  OverScrollMode_? overScrollMode;

  ///Informs WebView of the network state.
  ///This is used to set the JavaScript property `window.navigator.isOnline` and generates the online/offline event as specified in HTML5, sec. 5.7.7.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  bool? networkAvailable;

  ///Specifies the style of the scrollbars. The scrollbars can be overlaid or inset.
  ///When inset, they add to the padding of the view. And the scrollbars can be drawn inside the padding area or on the edge of the view.
  ///For example, if a view has a background drawable and you want to draw the scrollbars inside the padding specified by the drawable,
  ///you can use SCROLLBARS_INSIDE_OVERLAY or SCROLLBARS_INSIDE_INSET. If you want them to appear at the edge of the view, ignoring the padding,
  ///then you can use SCROLLBARS_OUTSIDE_OVERLAY or SCROLLBARS_OUTSIDE_INSET.
  ///The default value is [ScrollBarStyle.SCROLLBARS_INSIDE_OVERLAY].
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  ScrollBarStyle_? scrollBarStyle;

  ///Sets the position of the vertical scroll bar.
  ///The default value is [VerticalScrollbarPosition.SCROLLBAR_POSITION_DEFAULT].
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  VerticalScrollbarPosition_? verticalScrollbarPosition;

  ///Defines the delay in milliseconds that a scrollbar waits before fade out.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  int? scrollBarDefaultDelayBeforeFade;

  ///Defines whether scrollbars will fade when the view is not scrolling.
  ///The default value is `true`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  bool? scrollbarFadingEnabled;

  ///Defines the scrollbar fade duration in milliseconds.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  int? scrollBarFadeDuration;

  ///Sets the renderer priority policy for this WebView.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  RendererPriorityPolicy_? rendererPriorityPolicy;

  ///Sets whether the default Android error page should be disabled.
  ///The default value is `false`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  bool? disableDefaultErrorPage;

  ///Sets the vertical scrollbar thumb color.
  ///
  ///**NOTE**: available on Android 29+.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  Color? verticalScrollbarThumbColor;

  ///Sets the vertical scrollbar track color.
  ///
  ///**NOTE**: available on Android 29+.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  Color? verticalScrollbarTrackColor;

  ///Sets the horizontal scrollbar thumb color.
  ///
  ///**NOTE**: available on Android 29+.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  Color? horizontalScrollbarThumbColor;

  ///Sets the horizontal scrollbar track color.
  ///
  ///**NOTE**: available on Android 29+.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  Color? horizontalScrollbarTrackColor;

  ///Sets whether the WebView’s internal error page should be suppressed or displayed for bad navigations.
  ///`true` means suppressed (not shown), `false` means it will be displayed. The default value is `false`.
  ///
  ///**NOTE**: available on Android only if [WebViewFeature.SUPPRESS_ERROR_PAGE] feature is supported.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  bool? willSuppressErrorPage;

  ///Control whether algorithmic darkening is allowed.
  ///
  ///WebView always sets the media query `prefers-color-scheme` according to the app's theme attribute `isLightTheme`,
  ///i.e. `prefers-color-scheme` is light if `isLightTheme` is `true` or not specified, otherwise it is `dark`.
  ///This means that the web content's light or dark style will be applied automatically to match the app's theme if the content supports it.
  ///
  ///Algorithmic darkening is disallowed by default.
  ///
  ///If the app's theme is dark and it allows algorithmic darkening,
  ///WebView will attempt to darken web content using an algorithm,
  ///if the content doesn't define its own dark styles and doesn't explicitly disable darkening.
  ///
  ///If Android is applying Force Dark to WebView then WebView will ignore the value of this setting and behave as if it were set to true.
  ///
  ///**NOTE**: available on Android only if [WebViewFeature.ALGORITHMIC_DARKENING] feature is supported.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  bool? algorithmicDarkeningAllowed;

  ///Sets how the WebView will set the `X-Requested-With` header on requests.
  ///If you are calling this method, you may also want to call [ServiceWorkerWebSettingsCompat.setRequestedWithHeaderMode]
  ///with the same parameter value to configure ServiceWorker requests.
  ///The default behavior may vary depending on the WebView implementation.
  ///
  ///**NOTE**: available on Android only if [WebViewFeature.REQUESTED_WITH_HEADER_CONTROL] feature is supported.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  RequestedWithHeaderMode_? requestedWithHeaderMode;

  ///Sets whether EnterpriseAuthenticationAppLinkPolicy if set by admin is allowed to have any
  ///effect on WebView.
  ///
  ///EnterpriseAuthenticationAppLinkPolicy in WebView allows admins to specify authentication
  ///urls. When WebView is redirected to authentication url, and an app on the device has
  ///registered as the default handler for the url, that app is launched.
  ///
  ///The default value is `true`.
  ///
  ///**NOTE**: available on Android only if [WebViewFeature.ENTERPRISE_AUTHENTICATION_APP_LINK_POLICY] feature is supported.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Android native WebView
  bool? enterpriseAuthenticationAppLinkPolicyEnabled;

  ///Set to `true` to disable the bouncing of the WebView when the scrolling has reached an edge of the content. The default value is `false`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- iOS
  bool? disallowOverScroll;

  ///Set to `true` to allow a viewport meta tag to either disable or restrict the range of user scaling. The default value is `false`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- iOS
  ///- MacOS
  bool? enableViewportScale;

  ///Set to `true` if you want the WebView suppresses content rendering until it is fully loaded into memory. The default value is `false`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- iOS
  ///- MacOS
  bool? suppressesIncrementalRendering;

  ///Set to `true` to allow AirPlay. The default value is `true`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- iOS
  ///- MacOS
  bool? allowsAirPlayForMediaPlayback;

  ///Set to `true` to allow the horizontal swipe gestures trigger back-forward list navigations. The default value is `true`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- iOS
  ///- MacOS
  bool? allowsBackForwardNavigationGestures;

  ///Set to `true` to allow that pressing on a link displays a preview of the destination for the link. The default value is `true`.
  ///
  ///**NOTE**: available on iOS 9.0+.
  ///
  ///**Supported Platforms/Implementations**:
  ///- iOS
  ///- MacOS
  bool? allowsLinkPreview;

  ///Set to `true` if you want that the WebView should always allow scaling of the webpage, regardless of the author's intent.
  ///The ignoresViewportScaleLimits property overrides the `user-scalable` HTML property in a webpage. The default value is `false`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- iOS
  bool? ignoresViewportScaleLimits;

  ///Set to `true` to allow HTML5 media playback to appear inline within the screen layout, using browser-supplied controls rather than native controls.
  ///For this to work, add the `webkit-playsinline` attribute to any `<video>` elements. The default value is `false`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- iOS
  bool? allowsInlineMediaPlayback;

  ///Set to `true` to allow HTML5 videos play picture-in-picture. The default value is `true`.
  ///
  ///**NOTE**: available on iOS 9.0+.
  ///
  ///**Supported Platforms/Implementations**:
  ///- iOS
  bool? allowsPictureInPictureMediaPlayback;

  ///A Boolean value indicating whether warnings should be shown for suspected fraudulent content such as phishing or malware.
  ///According to the official documentation, this feature is currently available in the following region: China.
  ///The default value is `true`.
  ///
  ///**NOTE for iOS**: available on iOS 13.0+.
  ///
  ///**NOTE for MacOS**: available on MacOS 10.15+.
  ///
  ///**Supported Platforms/Implementations**:
  ///- iOS
  ///- MacOS
  bool? isFraudulentWebsiteWarningEnabled;

  ///The level of granularity with which the user can interactively select content in the web view.
  ///The default value is [SelectionGranularity.DYNAMIC].
  ///
  ///**Supported Platforms/Implementations**:
  ///- iOS
  SelectionGranularity_? selectionGranularity;

  ///Specifying a dataDetectoryTypes value adds interactivity to web content that matches the value.
  ///For example, Safari adds a link to “apple.com” in the text “Visit apple.com” if the dataDetectorTypes property is set to [DataDetectorTypes.LINK].
  ///The default value is [DataDetectorTypes.NONE].
  ///
  ///**NOTE**: available on iOS 10.0+.
  ///
  ///**Supported Platforms/Implementations**:
  ///- iOS
  List<DataDetectorTypes_>? dataDetectorTypes;

  ///Set `true` if shared cookies from `HTTPCookieStorage.shared` should used for every load request in the WebView.
  ///The default value is `false`.
  ///
  ///**NOTE for iOS**: available on iOS 11.0+.
  ///
  ///**NOTE for MacOS**: available on MacOS 10.13+.
  ///
  ///**Supported Platforms/Implementations**:
  ///- iOS
  ///- MacOS
  bool? sharedCookiesEnabled;

  ///Configures whether the scroll indicator insets are automatically adjusted by the system.
  ///The default value is `false`.
  ///
  ///**NOTE**: available on iOS 13.0+.
  ///
  ///**Supported Platforms/Implementations**:
  ///- iOS
  bool? automaticallyAdjustsScrollIndicatorInsets;

  ///A Boolean value indicating whether the WebView ignores an accessibility request to invert its colors.
  ///The default value is `false`.
  ///
  ///**NOTE**: available on iOS 11.0+.
  ///
  ///**Supported Platforms/Implementations**:
  ///- iOS
  bool? accessibilityIgnoresInvertColors;

  ///A [ScrollViewDecelerationRate] value that determines the rate of deceleration after the user lifts their finger.
  ///The default value is [ScrollViewDecelerationRate.NORMAL].
  ///
  ///**Supported Platforms/Implementations**:
  ///- iOS
  ScrollViewDecelerationRate_? decelerationRate;

  ///A Boolean value that determines whether bouncing always occurs when vertical scrolling reaches the end of the content.
  ///If this property is set to `true` and [InAppWebViewSettings.disallowOverScroll] is `false`,
  ///vertical dragging is allowed even if the content is smaller than the bounds of the scroll view.
  ///The default value is `false`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- iOS
  bool? alwaysBounceVertical;

  ///A Boolean value that determines whether bouncing always occurs when horizontal scrolling reaches the end of the content view.
  ///If this property is set to `true` and [InAppWebViewSettings.disallowOverScroll] is `false`,
  ///horizontal dragging is allowed even if the content is smaller than the bounds of the scroll view.
  ///The default value is `false`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- iOS
  bool? alwaysBounceHorizontal;

  ///A Boolean value that controls whether the scroll-to-top gesture is enabled.
  ///The scroll-to-top gesture is a tap on the status bar. When a user makes this gesture,
  ///the system asks the scroll view closest to the status bar to scroll to the top.
  ///The default value is `true`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- iOS
  bool? scrollsToTop;

  ///A Boolean value that determines whether paging is enabled for the scroll view.
  ///If the value of this property is true, the scroll view stops on multiples of the scroll view’s bounds when the user scrolls.
  ///The default value is `false`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- iOS
  bool? isPagingEnabled;

  ///A floating-point value that specifies the maximum scale factor that can be applied to the scroll view's content.
  ///This value determines how large the content can be scaled.
  ///It must be greater than the minimum zoom scale for zooming to be enabled.
  ///The default value is `1.0`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- iOS
  double? maximumZoomScale;

  ///A floating-point value that specifies the minimum scale factor that can be applied to the scroll view's content.
  ///This value determines how small the content can be scaled.
  ///The default value is `1.0`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- iOS
  double? minimumZoomScale;

  ///Configures how safe area insets are added to the adjusted content inset.
  ///The default value is [ScrollViewContentInsetAdjustmentBehavior.NEVER].
  ///
  ///**Supported Platforms/Implementations**:
  ///- iOS
  ScrollViewContentInsetAdjustmentBehavior_? contentInsetAdjustmentBehavior;

  ///A Boolean value that determines whether scrolling is disabled in a particular direction.
  ///If this property is `false`, scrolling is permitted in both horizontal and vertical directions.
  ///If this property is `true` and the user begins dragging in one general direction (horizontally or vertically),
  ///the scroll view disables scrolling in the other direction.
  ///If the drag direction is diagonal, then scrolling will not be locked and the user can drag in any direction until the drag completes.
  ///The default value is `false`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- iOS
  bool? isDirectionalLockEnabled;

  ///The media type for the contents of the web view.
  ///When the value of this property is `null`, the web view derives the current media type from the CSS media property of its content.
  ///If you assign a value other than `null` to this property, the web view uses the value you provide instead.
  ///The default value of this property is `null`.
  ///
  ///**NOTE for iOS**: available on iOS 14.0+.
  ///
  ///**NOTE for MacOS**: available on MacOS 11.0+.
  ///
  ///**Supported Platforms/Implementations**:
  ///- iOS
  ///- MacOS
  String? mediaType;

  ///The scale factor by which the web view scales content relative to its bounds.
  ///The default value of this property is `1.0`, which displays the content without any scaling.
  ///Changing the value of this property is equivalent to setting the CSS `zoom` property on all page content.
  ///
  ///**NOTE for iOS**: available on iOS 14.0+.
  ///
  ///**NOTE for MacOS**: available on MacOS 11.0+.
  ///
  ///**Supported Platforms/Implementations**:
  ///- iOS
  ///- MacOS
  double? pageZoom;

  ///A Boolean value that indicates whether the web view limits navigation to pages within the app’s domain.
  ///Check [App-Bound Domains](https://webkit.org/blog/10882/app-bound-domains/) for more details.
  ///The default value is `false`.
  ///
  ///**NOTE**: available on iOS 14.0+.
  ///
  ///**Supported Platforms/Implementations**:
  ///- iOS
  ///- MacOS
  bool? limitsNavigationsToAppBoundDomains;

  ///Set to `true` to be able to listen to the [WebView.onNavigationResponse] event. The default value is `false`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- iOS
  ///- MacOS
  bool? useOnNavigationResponse;

  ///Set to `true` to enable Apple Pay API for the [WebView] at its first page load or on the next page load (using [InAppWebViewController.setOptions]). The default value is `false`.
  ///
  ///**IMPORTANT NOTE**: As written in the official [Safari 13 Release Notes](https://developer.apple.com/documentation/safari-release-notes/safari-13-release-notes#Payment-Request-API),
  ///it won't work if any script injection APIs are used (such as [InAppWebViewController.evaluateJavascript] or [UserScript]).
  ///So, when this attribute is `true`, all the methods, options, and events implemented using JavaScript won't be called or won't do anything and the result will always be `null`.
  ///
  ///Methods affected:
  ///- [InAppWebViewController.addUserScript]
  ///- [InAppWebViewController.addUserScripts]
  ///- [InAppWebViewController.removeUserScript]
  ///- [InAppWebViewController.removeUserScripts]
  ///- [InAppWebViewController.removeAllUserScripts]
  ///- [InAppWebViewController.evaluateJavascript]
  ///- [InAppWebViewController.callAsyncJavaScript]
  ///- [InAppWebViewController.injectJavascriptFileFromUrl]
  ///- [InAppWebViewController.injectJavascriptFileFromAsset]
  ///- [InAppWebViewController.injectCSSCode]
  ///- [InAppWebViewController.injectCSSFileFromUrl]
  ///- [InAppWebViewController.injectCSSFileFromAsset]
  ///- [InAppWebViewController.findAllAsync]
  ///- [InAppWebViewController.findNext]
  ///- [InAppWebViewController.clearMatches]
  ///- [InAppWebViewController.pauseTimers]
  ///- [InAppWebViewController.getSelectedText]
  ///- [InAppWebViewController.getHitTestResult]
  ///- [InAppWebViewController.requestFocusNodeHref]
  ///- [InAppWebViewController.requestImageRef]
  ///- [InAppWebViewController.postWebMessage]
  ///- [InAppWebViewController.createWebMessageChannel]
  ///- [InAppWebViewController.addWebMessageListener]
  ///
  ///Also, on MacOS:
  ///- [InAppWebViewController.getScrollX]
  ///- [InAppWebViewController.getScrollY]
  ///- [InAppWebViewController.scrollTo]
  ///- [InAppWebViewController.scrollBy]
  ///- [InAppWebViewController.getContentHeight]
  ///- [InAppWebViewController.getContentWidth]
  ///- [InAppWebViewController.canScrollVertically]
  ///- [InAppWebViewController.canScrollHorizontally]
  ///
  ///Settings affected:
  ///- [WebView.initialUserScripts]
  ///- [InAppWebViewSettings.supportZoom]
  ///- [InAppWebViewSettings.useOnLoadResource]
  ///- [InAppWebViewSettings.useShouldInterceptAjaxRequest]
  ///- [InAppWebViewSettings.useShouldInterceptFetchRequest]
  ///- [InAppWebViewSettings.enableViewportScale]
  ///
  ///Events affected:
  ///- the `hitTestResult` argument of [WebView.onLongPressHitTestResult] will be empty
  ///- the `hitTestResult` argument of [ContextMenu.onCreateContextMenu] will be empty
  ///- [WebView.onLoadResource]
  ///- [WebView.shouldInterceptAjaxRequest]
  ///- [WebView.onAjaxReadyStateChange]
  ///- [WebView.onAjaxProgress]
  ///- [WebView.shouldInterceptFetchRequest]
  ///- [WebView.onConsoleMessage]
  ///- [WebView.onPrintRequest]
  ///- [WebView.onWindowFocus]
  ///- [WebView.onWindowBlur]
  ///- [WebView.onFindResultReceived]
  ///- [FindInteractionController.onFindResultReceived]
  ///
  ///Also, on MacOS:
  ///- [WebView.onScrollChanged]
  ///
  ///**NOTE for iOS**: available on iOS 13.0+.
  ///
  ///**Supported Platforms/Implementations**:
  ///- iOS
  ///- MacOS
  bool? applePayAPIEnabled;

  ///Used in combination with [WebView.initialUrlRequest] or [WebView.initialData] (using the `file://` scheme), it represents the URL from which to read the web content.
  ///This URL must be a file-based URL (using the `file://` scheme).
  ///Specify the same value as the [URLRequest.url] if you are using it with the [WebView.initialUrlRequest] parameter or
  ///the [InAppWebViewInitialData.baseUrl] if you are using it with the [WebView.initialData] parameter to prevent WebView from reading any other content.
  ///Specify a directory to give WebView permission to read additional files in the specified directory.
  ///
  ///**Supported Platforms/Implementations**:
  ///- iOS
  ///- MacOS
  Uri? allowingReadAccessTo;

  ///Set to `true` to disable the context menu (copy, select, etc.) that is shown when the user emits a long press event on a HTML link.
  ///This is implemented using also JavaScript, so it must be enabled or it won't work.
  ///The default value is `false`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- iOS
  bool? disableLongPressContextMenuOnLinks;

  ///Set to `true` to disable the [inputAccessoryView](https://developer.apple.com/documentation/uikit/uiresponder/1621119-inputaccessoryview) above system keyboard.
  ///The default value is `false`.
  ///
  ///**Supported Platforms/Implementations**:
  ///- iOS
  bool? disableInputAccessoryView;

  ///The color the web view displays behind the active page, visible when the user scrolls beyond the bounds of the page.
  ///
  ///The web view derives the default value of this property from the content of the page,
  ///using the background colors of the `<html>` and `<body>` elements with the background color of the web view.
  ///To override the default color, set this property to a new color.
  ///
  ///**NOTE for iOS**: available on iOS 15.0+.
  ///
  ///**NOTE for MacOS**: available on MacOS 12.0+.
  ///
  ///**Supported Platforms/Implementations**:
  ///- iOS
  ///- MacOS
  Color? underPageBackgroundColor;

  ///A Boolean value indicating whether text interaction is enabled or not.
  ///The default value is `true`.
  ///
  ///**NOTE for iOS**: available on iOS 14.5+.
  ///
  ///**NOTE for MacOS**: available on MacOS 11.3+.
  ///
  ///**Supported Platforms/Implementations**:
  ///- iOS
  ///- MacOS
  bool? isTextInteractionEnabled;

  ///A Boolean value indicating whether WebKit will apply built-in workarounds (quirks)
  ///to improve compatibility with certain known websites. You can disable site-specific quirks
  ///to help test your website without these workarounds. The default value is `true`.
  ///
  ///**NOTE for iOS**: available on iOS 15.4+.
  ///
  ///**NOTE for MacOS**: available on MacOS 12.0+.
  ///
  ///**Supported Platforms/Implementations**:
  ///- iOS
  ///- MacOS
  bool? isSiteSpecificQuirksModeEnabled;

  ///A Boolean value indicating whether HTTP requests to servers known to support HTTPS should be automatically upgraded to HTTPS requests.
  ///The default value is `true`.
  ///
  ///**NOTE for iOS**: available on iOS 14.5+.
  ///
  ///**NOTE for MacOS**: available on MacOS 11.3+.
  ///
  ///**Supported Platforms/Implementations**:
  ///- iOS
  ///- MacOS
  bool? upgradeKnownHostsToHTTPS;

  ///Sets whether fullscreen API is enabled or not.
  ///
  ///The default value is `true`.
  ///
  ///**NOTE for iOS**: available on iOS 15.4+.
  ///
  ///**NOTE for MacOS**: available on MacOS 12.0+.
  ///
  ///**Supported Platforms/Implementations**:
  ///- iOS
  ///- MacOS
  bool? isElementFullscreenEnabled;

  ///Sets whether the web view's built-in find interaction native UI is enabled or not.
  ///
  ///The default value is `false`.
  ///
  ///**NOTE**: available on iOS 16.0+.
  ///
  ///**Supported Platforms/Implementations**:
  ///- iOS
  bool? isFindInteractionEnabled;

  ///Set minimum viewport inset to the smallest inset a webpage may experience in your app's maximally collapsed UI configuration.
  ///Values must be either zero or positive. It must be smaller than [maximumViewportInset].
  ///
  ///**NOTE**: available on iOS 15.5+.
  ///
  ///**Supported Platforms/Implementations**:
  ///- iOS
  EdgeInsets? minimumViewportInset;

  ///Set maximum viewport inset to the largest inset a webpage may experience in your app's maximally expanded UI configuration.
  ///Values must be either zero or positive. It must be larger than [minimumViewportInset].
  ///
  ///**NOTE**: available on iOS 15.5+.
  ///
  ///**Supported Platforms/Implementations**:
  ///- iOS
  EdgeInsets? maximumViewportInset;

  ///Specifies a feature policy for the `<iframe>`.
  ///The policy defines what features are available to the `<iframe>` based on the origin of the request
  ///(e.g. access to the microphone, camera, battery, web-share API, etc.).
  ///
  ///**Supported Platforms/Implementations**:
  ///- Web
  String? iframeAllow;

  ///Set to true if the `<iframe>` can activate fullscreen mode by calling the `requestFullscreen()` method.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Web
  bool? iframeAllowFullscreen;

  ///Applies extra restrictions to the content in the frame.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Web
  Set<Sandbox_>? iframeSandbox;

  ///A string that reflects the `referrerpolicy` HTML attribute indicating which referrer to use when fetching the linked resource.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Web
  ReferrerPolicy_? iframeReferrerPolicy;

  ///A string that reflects the `name` HTML attribute, containing a name by which to refer to the frame.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Web
  String? iframeName;

  ///A Content Security Policy enforced for the embedded resource.
  ///
  ///**Supported Platforms/Implementations**:
  ///- Web
  String? iframeCsp;

  InAppWebViewSettings_({
    this.useShouldOverrideUrlLoading = false,
    this.useOnLoadResource = false,
    this.useOnDownloadStart = false,
    this.clearCache = false,
    this.userAgent = "",
    this.applicationNameForUserAgent = "",
    this.javaScriptEnabled = true,
    this.javaScriptCanOpenWindowsAutomatically = false,
    this.mediaPlaybackRequiresUserGesture = true,
    this.minimumFontSize,
    this.verticalScrollBarEnabled = true,
    this.horizontalScrollBarEnabled = true,
    this.resourceCustomSchemes = const [],
    this.contentBlockers = const [],
    this.preferredContentMode = UserPreferredContentMode_.RECOMMENDED,
    this.useShouldInterceptAjaxRequest = false,
    this.useShouldInterceptFetchRequest = false,
    this.incognito = false,
    this.cacheEnabled = true,
    this.transparentBackground = false,
    this.disableVerticalScroll = false,
    this.disableHorizontalScroll = false,
    this.disableContextMenu = false,
    this.supportZoom = true,
    this.allowFileAccessFromFileURLs = false,
    this.allowUniversalAccessFromFileURLs = false,
    this.textZoom = 100,
    this.clearSessionCache = false,
    this.builtInZoomControls = true,
    this.displayZoomControls = false,
    this.databaseEnabled = true,
    this.domStorageEnabled = true,
    this.useWideViewPort = true,
    this.safeBrowsingEnabled = true,
    this.mixedContentMode,
    this.allowContentAccess = true,
    this.allowFileAccess = true,
    this.appCachePath,
    this.blockNetworkImage = false,
    this.blockNetworkLoads = false,
    this.cacheMode = CacheMode_.LOAD_DEFAULT,
    this.cursiveFontFamily = "cursive",
    this.defaultFixedFontSize = 16,
    this.defaultFontSize = 16,
    this.defaultTextEncodingName = "UTF-8",
    this.disabledActionModeMenuItems,
    this.fantasyFontFamily = "fantasy",
    this.fixedFontFamily = "monospace",
    this.forceDark = ForceDark_.OFF,
    this.forceDarkStrategy =
        ForceDarkStrategy_.PREFER_WEB_THEME_OVER_USER_AGENT_DARKENING,
    this.geolocationEnabled = true,
    this.layoutAlgorithm,
    this.loadWithOverviewMode = true,
    this.loadsImagesAutomatically = true,
    this.minimumLogicalFontSize = 8,
    this.needInitialFocus = true,
    this.offscreenPreRaster = false,
    this.sansSerifFontFamily = "sans-serif",
    this.serifFontFamily = "sans-serif",
    this.standardFontFamily = "sans-serif",
    this.saveFormData = true,
    this.thirdPartyCookiesEnabled = true,
    this.hardwareAcceleration = true,
    this.initialScale = 0,
    this.supportMultipleWindows = false,
    this.regexToCancelSubFramesLoading,
    this.useHybridComposition = true,
    this.useShouldInterceptRequest = false,
    this.useOnRenderProcessGone = false,
    this.overScrollMode = OverScrollMode_.IF_CONTENT_SCROLLS,
    this.networkAvailable,
    this.scrollBarStyle = ScrollBarStyle_.SCROLLBARS_INSIDE_OVERLAY,
    this.verticalScrollbarPosition =
        VerticalScrollbarPosition_.SCROLLBAR_POSITION_DEFAULT,
    this.scrollBarDefaultDelayBeforeFade,
    this.scrollbarFadingEnabled = true,
    this.scrollBarFadeDuration,
    this.rendererPriorityPolicy,
    this.disableDefaultErrorPage = false,
    this.verticalScrollbarThumbColor,
    this.verticalScrollbarTrackColor,
    this.horizontalScrollbarThumbColor,
    this.horizontalScrollbarTrackColor,
    this.willSuppressErrorPage = false,
    this.algorithmicDarkeningAllowed = false,
    this.requestedWithHeaderMode,
    this.enterpriseAuthenticationAppLinkPolicyEnabled = true,
    this.disallowOverScroll = false,
    this.enableViewportScale = false,
    this.suppressesIncrementalRendering = false,
    this.allowsAirPlayForMediaPlayback = true,
    this.allowsBackForwardNavigationGestures = true,
    this.allowsLinkPreview = true,
    this.ignoresViewportScaleLimits = false,
    this.allowsInlineMediaPlayback = false,
    this.allowsPictureInPictureMediaPlayback = true,
    this.isFraudulentWebsiteWarningEnabled = true,
    this.selectionGranularity = SelectionGranularity_.DYNAMIC,
    this.dataDetectorTypes = const [DataDetectorTypes_.NONE],
    this.sharedCookiesEnabled = false,
    this.automaticallyAdjustsScrollIndicatorInsets = false,
    this.accessibilityIgnoresInvertColors = false,
    this.decelerationRate = ScrollViewDecelerationRate_.NORMAL,
    this.alwaysBounceVertical = false,
    this.alwaysBounceHorizontal = false,
    this.scrollsToTop = true,
    this.isPagingEnabled = false,
    this.maximumZoomScale = 1.0,
    this.minimumZoomScale = 1.0,
    this.contentInsetAdjustmentBehavior =
        ScrollViewContentInsetAdjustmentBehavior_.NEVER,
    this.isDirectionalLockEnabled = false,
    this.mediaType,
    this.pageZoom = 1.0,
    this.limitsNavigationsToAppBoundDomains = false,
    this.useOnNavigationResponse = false,
    this.applePayAPIEnabled = false,
    this.allowingReadAccessTo,
    this.disableLongPressContextMenuOnLinks = false,
    this.disableInputAccessoryView = false,
    this.underPageBackgroundColor,
    this.isTextInteractionEnabled = true,
    this.isSiteSpecificQuirksModeEnabled = true,
    this.upgradeKnownHostsToHTTPS = true,
    this.isElementFullscreenEnabled = true,
    this.isFindInteractionEnabled = false,
    this.minimumViewportInset,
    this.maximumViewportInset,
    this.iframeAllow,
    this.iframeAllowFullscreen,
    this.iframeSandbox,
    this.iframeReferrerPolicy,
    this.iframeName,
    this.iframeCsp,
  }) {
    if (this.minimumFontSize == null)
      this.minimumFontSize =
          defaultTargetPlatform == TargetPlatform.android ? 8 : 0;
    assert(this.resourceCustomSchemes == null ||
        (this.resourceCustomSchemes != null &&
            !this.resourceCustomSchemes!.contains("http") &&
            !this.resourceCustomSchemes!.contains("https")));
    assert(
        allowingReadAccessTo == null || allowingReadAccessTo!.isScheme("file"));
    assert(
        (minimumViewportInset == null && maximumViewportInset == null) ||
            minimumViewportInset != null &&
                maximumViewportInset != null &&
                minimumViewportInset!.isNonNegative &&
                maximumViewportInset!.isNonNegative &&
                minimumViewportInset!.vertical <=
                    maximumViewportInset!.vertical &&
                minimumViewportInset!.horizontal <=
                    maximumViewportInset!.horizontal,
        "minimumViewportInset cannot be larger than maximumViewportInset");
  }

  // Map<String, dynamic> toMap() {
  //   List<Map<String, Map<String, dynamic>>> contentBlockersMapList = [];
  //   contentBlockers.forEach((contentBlocker) {
  //     contentBlockersMapList.add(contentBlocker.toMap());
  //   });
  //   List<String> dataDetectorTypesList = [];
  //   dataDetectorTypes.forEach((dataDetectorType) {
  //     dataDetectorTypesList.add(dataDetectorType.toNativeValue());
  //   });
  //
  //   return {
  //     "useShouldOverrideUrlLoading": useShouldOverrideUrlLoading,
  //     "useOnLoadResource": useOnLoadResource,
  //     "useOnDownloadStart": useOnDownloadStart,
  //     "clearCache": clearCache,
  //     "userAgent": userAgent,
  //     "applicationNameForUserAgent": applicationNameForUserAgent,
  //     "javaScriptEnabled": javaScriptEnabled,
  //     "javaScriptCanOpenWindowsAutomatically":
  //         javaScriptCanOpenWindowsAutomatically,
  //     "mediaPlaybackRequiresUserGesture": mediaPlaybackRequiresUserGesture,
  //     "verticalScrollBarEnabled": verticalScrollBarEnabled,
  //     "horizontalScrollBarEnabled": horizontalScrollBarEnabled,
  //     "resourceCustomSchemes": resourceCustomSchemes,
  //     "contentBlockers": contentBlockersMapList,
  //     "preferredContentMode": preferredContentMode?.toNativeValue(),
  //     "useShouldInterceptAjaxRequest": useShouldInterceptAjaxRequest,
  //     "useShouldInterceptFetchRequest": useShouldInterceptFetchRequest,
  //     "incognito": incognito,
  //     "cacheEnabled": cacheEnabled,
  //     "transparentBackground": transparentBackground,
  //     "disableVerticalScroll": disableVerticalScroll,
  //     "disableHorizontalScroll": disableHorizontalScroll,
  //     "disableContextMenu": disableContextMenu,
  //     "supportZoom": supportZoom,
  //     "allowFileAccessFromFileURLs": allowFileAccessFromFileURLs,
  //     "allowUniversalAccessFromFileURLs": allowUniversalAccessFromFileURLs,
  //     "textZoom": textZoom,
  //     "clearSessionCache": clearSessionCache,
  //     "builtInZoomControls": builtInZoomControls,
  //     "displayZoomControls": displayZoomControls,
  //     "databaseEnabled": databaseEnabled,
  //     "domStorageEnabled": domStorageEnabled,
  //     "useWideViewPort": useWideViewPort,
  //     "safeBrowsingEnabled": safeBrowsingEnabled,
  //     "mixedContentMode": mixedContentMode?.toNativeValue(),
  //     "allowContentAccess": allowContentAccess,
  //     "allowFileAccess": allowFileAccess,
  //     "appCachePath": appCachePath,
  //     "blockNetworkImage": blockNetworkImage,
  //     "blockNetworkLoads": blockNetworkLoads,
  //     "cacheMode": cacheMode?.toNativeValue(),
  //     "cursiveFontFamily": cursiveFontFamily,
  //     "defaultFixedFontSize": defaultFixedFontSize,
  //     "defaultFontSize": defaultFontSize,
  //     "defaultTextEncodingName": defaultTextEncodingName,
  //     "disabledActionModeMenuItems":
  //         disabledActionModeMenuItems?.toNativeValue(),
  //     "fantasyFontFamily": fantasyFontFamily,
  //     "fixedFontFamily": fixedFontFamily,
  //     "forceDark": forceDark?.toNativeValue(),
  //     "forceDarkStrategy": forceDarkStrategy?.toNativeValue(),
  //     "geolocationEnabled": geolocationEnabled,
  //     "layoutAlgorithm": layoutAlgorithm?.toNativeValue(),
  //     "loadWithOverviewMode": loadWithOverviewMode,
  //     "loadsImagesAutomatically": loadsImagesAutomatically,
  //     "minimumLogicalFontSize": minimumLogicalFontSize,
  //     "initialScale": initialScale,
  //     "needInitialFocus": needInitialFocus,
  //     "offscreenPreRaster": offscreenPreRaster,
  //     "sansSerifFontFamily": sansSerifFontFamily,
  //     "serifFontFamily": serifFontFamily,
  //     "standardFontFamily": standardFontFamily,
  //     "saveFormData": saveFormData,
  //     "thirdPartyCookiesEnabled": thirdPartyCookiesEnabled,
  //     "hardwareAcceleration": hardwareAcceleration,
  //     "supportMultipleWindows": supportMultipleWindows,
  //     "useHybridComposition": useHybridComposition,
  //     "regexToCancelSubFramesLoading": regexToCancelSubFramesLoading,
  //     "useShouldInterceptRequest": useShouldInterceptRequest,
  //     "useOnRenderProcessGone": useOnRenderProcessGone,
  //     "overScrollMode": overScrollMode?.toNativeValue(),
  //     "networkAvailable": networkAvailable,
  //     "scrollBarStyle": scrollBarStyle?.toNativeValue(),
  //     "verticalScrollbarPosition": verticalScrollbarPosition?.toNativeValue(),
  //     "scrollBarDefaultDelayBeforeFade": scrollBarDefaultDelayBeforeFade,
  //     "scrollbarFadingEnabled": scrollbarFadingEnabled,
  //     "scrollBarFadeDuration": scrollBarFadeDuration,
  //     "rendererPriorityPolicy": rendererPriorityPolicy?.toMap(),
  //     "disableDefaultErrorPage": disableDefaultErrorPage,
  //     "verticalScrollbarThumbColor": verticalScrollbarThumbColor?.toHex(),
  //     "verticalScrollbarTrackColor": verticalScrollbarTrackColor?.toHex(),
  //     "horizontalScrollbarThumbColor": horizontalScrollbarThumbColor?.toHex(),
  //     "horizontalScrollbarTrackColor": horizontalScrollbarTrackColor?.toHex(),
  //     "willSuppressErrorPage": willSuppressErrorPage,
  //     "algorithmicDarkeningAllowed": algorithmicDarkeningAllowed,
  //     "requestedWithHeaderMode": requestedWithHeaderMode?.toNativeValue(),
  //     "enterpriseAuthenticationAppLinkPolicyEnabled":
  //         enterpriseAuthenticationAppLinkPolicyEnabled,
  //     "disallowOverScroll": disallowOverScroll,
  //     "enableViewportScale": enableViewportScale,
  //     "suppressesIncrementalRendering": suppressesIncrementalRendering,
  //     "allowsAirPlayForMediaPlayback": allowsAirPlayForMediaPlayback,
  //     "allowsBackForwardNavigationGestures":
  //         allowsBackForwardNavigationGestures,
  //     "allowsLinkPreview": allowsLinkPreview,
  //     "ignoresViewportScaleLimits": ignoresViewportScaleLimits,
  //     "allowsInlineMediaPlayback": allowsInlineMediaPlayback,
  //     "allowsPictureInPictureMediaPlayback":
  //         allowsPictureInPictureMediaPlayback,
  //     "isFraudulentWebsiteWarningEnabled": isFraudulentWebsiteWarningEnabled,
  //     "selectionGranularity": selectionGranularity.toNativeValue(),
  //     "dataDetectorTypes": dataDetectorTypesList,
  //     "sharedCookiesEnabled": sharedCookiesEnabled,
  //     "automaticallyAdjustsScrollIndicatorInsets":
  //         automaticallyAdjustsScrollIndicatorInsets,
  //     "accessibilityIgnoresInvertColors": accessibilityIgnoresInvertColors,
  //     "decelerationRate": decelerationRate.toNativeValue(),
  //     "alwaysBounceVertical": alwaysBounceVertical,
  //     "alwaysBounceHorizontal": alwaysBounceHorizontal,
  //     "scrollsToTop": scrollsToTop,
  //     "isPagingEnabled": isPagingEnabled,
  //     "maximumZoomScale": maximumZoomScale,
  //     "minimumZoomScale": minimumZoomScale,
  //     "contentInsetAdjustmentBehavior":
  //         contentInsetAdjustmentBehavior.toNativeValue(),
  //     "isDirectionalLockEnabled": isDirectionalLockEnabled,
  //     "mediaType": mediaType,
  //     "pageZoom": pageZoom,
  //     "limitsNavigationsToAppBoundDomains": limitsNavigationsToAppBoundDomains,
  //     "useOnNavigationResponse": useOnNavigationResponse,
  //     "applePayAPIEnabled": applePayAPIEnabled,
  //     "allowingReadAccessTo": allowingReadAccessTo.toString(),
  //     "disableLongPressContextMenuOnLinks": disableLongPressContextMenuOnLinks,
  //     "disableInputAccessoryView": disableInputAccessoryView,
  //     "underPageBackgroundColor": underPageBackgroundColor?.toHex(),
  //     "isTextInteractionEnabled": isTextInteractionEnabled,
  //     "isSiteSpecificQuirksModeEnabled": isSiteSpecificQuirksModeEnabled,
  //     "upgradeKnownHostsToHTTPS": upgradeKnownHostsToHTTPS,
  //     "isElementFullscreenEnabled": isElementFullscreenEnabled,
  //     "isFindInteractionEnabled": isFindInteractionEnabled,
  //     "minimumViewportInset": minimumViewportInset?.toMap(),
  //     "maximumViewportInset": maximumViewportInset?.toMap(),
  //     "iframeAllow": iframeAllow,
  //     "iframeAllowFullscreen": iframeAllowFullscreen,
  //     "iframeSandbox": iframeSandbox?.map((e) => e.toNativeValue()).toList(),
  //     "iframeReferrerPolicy": iframeReferrerPolicy,
  //     "iframeName": iframeName,
  //     "iframeCsp": iframeCsp,
  //   };
  // }
  //
  // ///Gets a [InAppWebViewSettings] instance from a [Map] value.
  // factory InAppWebViewSettings.fromMap(Map<String, dynamic> map) {
  //   List<ContentBlocker> contentBlockers = [];
  //   List<dynamic>? contentBlockersMapList = map["contentBlockers"];
  //   if (contentBlockersMapList != null) {
  //     contentBlockersMapList.forEach((contentBlocker) {
  //       contentBlockers.add(ContentBlocker.fromMap(
  //           Map<dynamic, Map<dynamic, dynamic>>.from(
  //               Map<dynamic, dynamic>.from(contentBlocker))));
  //     });
  //   }
  //   List<DataDetectorTypes> dataDetectorTypes = [];
  //   List<String> dataDetectorTypesList =
  //       List<String>.from(map["dataDetectorTypes"] ?? []);
  //   dataDetectorTypesList.forEach((dataDetectorTypeValue) {
  //     var dataDetectorType =
  //         DataDetectorTypes.fromNativeValue(dataDetectorTypeValue);
  //     if (dataDetectorType != null) {
  //       dataDetectorTypes.add(dataDetectorType);
  //     }
  //   });
  //
  //   var settings = InAppWebViewSettings();
  //   settings.useShouldOverrideUrlLoading = map["useShouldOverrideUrlLoading"];
  //   settings.useOnLoadResource = map["useOnLoadResource"];
  //   settings.useOnDownloadStart = map["useOnDownloadStart"];
  //   settings.clearCache = map["clearCache"];
  //   settings.userAgent = map["userAgent"];
  //   settings.applicationNameForUserAgent = map["applicationNameForUserAgent"];
  //   settings.javaScriptEnabled = map["javaScriptEnabled"];
  //   settings.javaScriptCanOpenWindowsAutomatically =
  //       map["javaScriptCanOpenWindowsAutomatically"];
  //   settings.mediaPlaybackRequiresUserGesture =
  //       map["mediaPlaybackRequiresUserGesture"];
  //   settings.verticalScrollBarEnabled = map["verticalScrollBarEnabled"];
  //   settings.horizontalScrollBarEnabled = map["horizontalScrollBarEnabled"];
  //   settings.resourceCustomSchemes =
  //       List<String>.from(map["resourceCustomSchemes"] ?? []);
  //   settings.contentBlockers = contentBlockers;
  //   settings.preferredContentMode =
  //       UserPreferredContentMode.fromNativeValue(map["preferredContentMode"]);
  //   settings.useShouldInterceptAjaxRequest =
  //       map["useShouldInterceptAjaxRequest"];
  //   settings.useShouldInterceptFetchRequest =
  //       map["useShouldInterceptFetchRequest"];
  //   settings.incognito = map["incognito"];
  //   settings.cacheEnabled = map["cacheEnabled"];
  //   settings.transparentBackground = map["transparentBackground"];
  //   settings.disableVerticalScroll = map["disableVerticalScroll"];
  //   settings.disableHorizontalScroll = map["disableHorizontalScroll"];
  //   settings.disableContextMenu = map["disableContextMenu"];
  //   settings.supportZoom = map["supportZoom"];
  //   settings.allowFileAccessFromFileURLs = map["allowFileAccessFromFileURLs"];
  //   settings.allowUniversalAccessFromFileURLs =
  //       map["allowUniversalAccessFromFileURLs"];
  //   if (kIsWeb) {
  //     settings.iframeAllow = map["iframeAllow"];
  //     settings.iframeAllowFullscreen = map["iframeAllowFullscreen"];
  //     settings.iframeSandbox = map["iframeSandbox"] != null
  //         ? Set.from((map["iframeSandbox"].cast<String>() as List<String>)
  //             .map((e) => Sandbox.fromNativeValue(e)))
  //         : null;
  //     settings.iframeReferrerPolicy =
  //         ReferrerPolicy.fromNativeValue(map["iframeReferrerPolicy"]);
  //     settings.iframeName = map["iframeName"];
  //     settings.iframeCsp = map["iframeCsp"];
  //   } else {
  //     if (defaultTargetPlatform == TargetPlatform.android) {
  //       settings.textZoom = map["textZoom"];
  //       settings.clearSessionCache = map["clearSessionCache"];
  //       settings.builtInZoomControls = map["builtInZoomControls"];
  //       settings.displayZoomControls = map["displayZoomControls"];
  //       settings.databaseEnabled = map["databaseEnabled"];
  //       settings.domStorageEnabled = map["domStorageEnabled"];
  //       settings.useWideViewPort = map["useWideViewPort"];
  //       settings.safeBrowsingEnabled = map["safeBrowsingEnabled"];
  //       settings.mixedContentMode =
  //           MixedContentMode.fromNativeValue(map["mixedContentMode"]);
  //       settings.allowContentAccess = map["allowContentAccess"];
  //       settings.allowFileAccess = map["allowFileAccess"];
  //       settings.appCachePath = map["appCachePath"];
  //       settings.blockNetworkImage = map["blockNetworkImage"];
  //       settings.blockNetworkLoads = map["blockNetworkLoads"];
  //       settings.cacheMode = CacheMode.fromNativeValue(map["cacheMode"]);
  //       settings.cursiveFontFamily = map["cursiveFontFamily"];
  //       settings.defaultFixedFontSize = map["defaultFixedFontSize"];
  //       settings.defaultFontSize = map["defaultFontSize"];
  //       settings.defaultTextEncodingName = map["defaultTextEncodingName"];
  //       settings.disabledActionModeMenuItems =
  //           ActionModeMenuItem.fromNativeValue(
  //               map["disabledActionModeMenuItems"]);
  //       settings.fantasyFontFamily = map["fantasyFontFamily"];
  //       settings.fixedFontFamily = map["fixedFontFamily"];
  //       settings.forceDark = ForceDark.fromNativeValue(map["forceDark"]);
  //       settings.forceDarkStrategy =
  //           ForceDarkStrategy.fromNativeValue(map["forceDarkStrategy"]);
  //       settings.geolocationEnabled = map["geolocationEnabled"];
  //       settings.layoutAlgorithm =
  //           LayoutAlgorithm.fromNativeValue(map["layoutAlgorithm"]);
  //       settings.loadWithOverviewMode = map["loadWithOverviewMode"];
  //       settings.loadsImagesAutomatically = map["loadsImagesAutomatically"];
  //       settings.minimumLogicalFontSize = map["minimumLogicalFontSize"];
  //       settings.initialScale = map["initialScale"];
  //       settings.needInitialFocus = map["needInitialFocus"];
  //       settings.offscreenPreRaster = map["offscreenPreRaster"];
  //       settings.sansSerifFontFamily = map["sansSerifFontFamily"];
  //       settings.serifFontFamily = map["serifFontFamily"];
  //       settings.standardFontFamily = map["standardFontFamily"];
  //       settings.saveFormData = map["saveFormData"];
  //       settings.thirdPartyCookiesEnabled = map["thirdPartyCookiesEnabled"];
  //       settings.hardwareAcceleration = map["hardwareAcceleration"];
  //       settings.supportMultipleWindows = map["supportMultipleWindows"];
  //       settings.regexToCancelSubFramesLoading =
  //           map["regexToCancelSubFramesLoading"];
  //       settings.useHybridComposition = map["useHybridComposition"];
  //       settings.useShouldInterceptRequest = map["useShouldInterceptRequest"];
  //       settings.useOnRenderProcessGone = map["useOnRenderProcessGone"];
  //       settings.overScrollMode =
  //           OverScrollMode.fromNativeValue(map["overScrollMode"]);
  //       settings.networkAvailable = map["networkAvailable"];
  //       settings.scrollBarStyle =
  //           ScrollBarStyle.fromNativeValue(map["scrollBarStyle"]);
  //       settings.verticalScrollbarPosition =
  //           VerticalScrollbarPosition.fromNativeValue(
  //               map["verticalScrollbarPosition"]);
  //       settings.scrollBarDefaultDelayBeforeFade =
  //           map["scrollBarDefaultDelayBeforeFade"];
  //       settings.scrollbarFadingEnabled = map["scrollbarFadingEnabled"];
  //       settings.scrollBarFadeDuration = map["scrollBarFadeDuration"];
  //       settings.rendererPriorityPolicy = RendererPriorityPolicy.fromMap(
  //           map["rendererPriorityPolicy"]?.cast<String, dynamic>());
  //       settings.disableDefaultErrorPage = map["disableDefaultErrorPage"];
  //       settings.verticalScrollbarThumbColor =
  //           UtilColor.fromHex(map["verticalScrollbarThumbColor"]);
  //       settings.verticalScrollbarTrackColor =
  //           UtilColor.fromHex(map["verticalScrollbarTrackColor"]);
  //       settings.horizontalScrollbarThumbColor =
  //           UtilColor.fromHex(map["horizontalScrollbarThumbColor"]);
  //       settings.horizontalScrollbarTrackColor =
  //           UtilColor.fromHex(map["horizontalScrollbarTrackColor"]);
  //       settings.willSuppressErrorPage = map["willSuppressErrorPage"];
  //       settings.algorithmicDarkeningAllowed =
  //           map["algorithmicDarkeningAllowed"];
  //       settings.requestedWithHeaderMode =
  //           RequestedWithHeaderMode.fromNativeValue(
  //               map["requestedWithHeaderMode"]);
  //       settings.enterpriseAuthenticationAppLinkPolicyEnabled =
  //           map["enterpriseAuthenticationAppLinkPolicyEnabled"];
  //     } else if (defaultTargetPlatform == TargetPlatform.iOS ||
  //         defaultTargetPlatform == TargetPlatform.macOS) {
  //       settings.disallowOverScroll = map["disallowOverScroll"];
  //       settings.enableViewportScale = map["enableViewportScale"];
  //       settings.suppressesIncrementalRendering =
  //           map["suppressesIncrementalRendering"];
  //       settings.allowsAirPlayForMediaPlayback =
  //           map["allowsAirPlayForMediaPlayback"];
  //       settings.allowsBackForwardNavigationGestures =
  //           map["allowsBackForwardNavigationGestures"];
  //       settings.allowsLinkPreview = map["allowsLinkPreview"];
  //       settings.ignoresViewportScaleLimits = map["ignoresViewportScaleLimits"];
  //       settings.allowsInlineMediaPlayback = map["allowsInlineMediaPlayback"];
  //       settings.allowsPictureInPictureMediaPlayback =
  //           map["allowsPictureInPictureMediaPlayback"];
  //       settings.isFraudulentWebsiteWarningEnabled =
  //           map["isFraudulentWebsiteWarningEnabled"];
  //       settings.selectionGranularity =
  //           SelectionGranularity.fromNativeValue(map["selectionGranularity"])!;
  //       settings.dataDetectorTypes = dataDetectorTypes;
  //       settings.sharedCookiesEnabled = map["sharedCookiesEnabled"];
  //       settings.automaticallyAdjustsScrollIndicatorInsets =
  //           map["automaticallyAdjustsScrollIndicatorInsets"];
  //       settings.accessibilityIgnoresInvertColors =
  //           map["accessibilityIgnoresInvertColors"];
  //       settings.decelerationRate = ScrollViewDecelerationRate.fromNativeValue(
  //           map["decelerationRate"])!;
  //       settings.alwaysBounceVertical = map["alwaysBounceVertical"];
  //       settings.alwaysBounceHorizontal = map["alwaysBounceHorizontal"];
  //       settings.scrollsToTop = map["scrollsToTop"];
  //       settings.isPagingEnabled = map["isPagingEnabled"];
  //       settings.maximumZoomScale = map["maximumZoomScale"];
  //       settings.minimumZoomScale = map["minimumZoomScale"];
  //       settings.contentInsetAdjustmentBehavior =
  //           ScrollViewContentInsetAdjustmentBehavior.fromNativeValue(
  //               map["contentInsetAdjustmentBehavior"])!;
  //       settings.isDirectionalLockEnabled = map["isDirectionalLockEnabled"];
  //       settings.mediaType = map["mediaType"];
  //       settings.pageZoom = map["pageZoom"];
  //       settings.limitsNavigationsToAppBoundDomains =
  //           map["limitsNavigationsToAppBoundDomains"];
  //       settings.useOnNavigationResponse = map["useOnNavigationResponse"];
  //       settings.applePayAPIEnabled = map["applePayAPIEnabled"];
  //       settings.allowingReadAccessTo = map["allowingReadAccessTo"] != null
  //           ? Uri.parse(map["allowingReadAccessTo"])
  //           : null;
  //       settings.disableLongPressContextMenuOnLinks =
  //           map["disableLongPressContextMenuOnLinks"];
  //       settings.disableInputAccessoryView = map["disableInputAccessoryView"];
  //       settings.underPageBackgroundColor =
  //           UtilColor.fromHex(map["underPageBackgroundColor"]);
  //       settings.isTextInteractionEnabled = map["isTextInteractionEnabled"];
  //       settings.isSiteSpecificQuirksModeEnabled =
  //           map["isSiteSpecificQuirksModeEnabled"];
  //       settings.upgradeKnownHostsToHTTPS = map["upgradeKnownHostsToHTTPS"];
  //       settings.isElementFullscreenEnabled = map["isElementFullscreenEnabled"];
  //       settings.isFindInteractionEnabled = map["isFindInteractionEnabled"];
  //       settings.minimumViewportInset = MapEdgeInsets.fromMap(
  //           map["minimumViewportInset"]?.cast<String, double>());
  //       settings.maximumViewportInset = MapEdgeInsets.fromMap(
  //           map["maximumViewportInset"]?.cast<String, double>());
  //     }
  //   }
  //   return settings;
  // }
}

///Class that represents the options that can be used for a [WebView].
///Use [InAppWebViewSettings] instead.
@Deprecated('Use InAppWebViewSettings instead')
class InAppWebViewGroupOptions {
  ///Cross-platform options.
  late InAppWebViewOptions crossPlatform;

  ///Android-specific options.
  late AndroidInAppWebViewOptions android;

  ///iOS-specific options.
  late IOSInAppWebViewOptions ios;

  InAppWebViewGroupOptions(
      {InAppWebViewOptions? crossPlatform,
      AndroidInAppWebViewOptions? android,
      IOSInAppWebViewOptions? ios}) {
    this.crossPlatform = crossPlatform ?? InAppWebViewOptions();
    this.android = android ?? AndroidInAppWebViewOptions();
    this.ios = ios ?? IOSInAppWebViewOptions();
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> options = {};
    options.addAll(this.crossPlatform.toMap());
    if (defaultTargetPlatform == TargetPlatform.android)
      options.addAll(this.android.toMap());
    else if (defaultTargetPlatform == TargetPlatform.iOS)
      options.addAll(this.ios.toMap());

    return options;
  }

  static InAppWebViewGroupOptions fromMap(Map<String, dynamic> options) {
    InAppWebViewGroupOptions inAppWebViewGroupOptions =
        InAppWebViewGroupOptions();

    inAppWebViewGroupOptions.crossPlatform =
        InAppWebViewOptions.fromMap(options);
    if (defaultTargetPlatform == TargetPlatform.android)
      inAppWebViewGroupOptions.android =
          AndroidInAppWebViewOptions.fromMap(options);
    else if (defaultTargetPlatform == TargetPlatform.iOS)
      inAppWebViewGroupOptions.ios = IOSInAppWebViewOptions.fromMap(options);

    return inAppWebViewGroupOptions;
  }

  Map<String, dynamic> toJson() {
    return this.toMap();
  }

  @override
  String toString() {
    return toMap().toString();
  }

  InAppWebViewGroupOptions copy() {
    return InAppWebViewGroupOptions.fromMap(this.toMap());
  }
}

class WebViewOptions {
  Map<String, dynamic> toMap() {
    return {};
  }

  static WebViewOptions fromMap(Map<String, dynamic> map) {
    return WebViewOptions();
  }

  WebViewOptions copy() {
    return WebViewOptions.fromMap(this.toMap());
  }

  Map<String, dynamic> toJson() {
    return this.toMap();
  }

  @override
  String toString() {
    return toMap().toString();
  }
}

///Use [InAppWebViewSettings] instead.
@Deprecated('Use InAppWebViewSettings instead')
class InAppWebViewOptions
    implements WebViewOptions, BrowserOptions, AndroidOptions, IosOptions {
  ///Set to `true` to be able to listen at the [WebView.shouldOverrideUrlLoading] event. The default value is `false`.
  bool useShouldOverrideUrlLoading;

  ///Set to `true` to be able to listen at the [WebView.onLoadResource] event. The default value is `false`.
  bool useOnLoadResource;

  ///Set to `true` to be able to listen at the [WebView.onDownloadStart] event. The default value is `false`.
  bool useOnDownloadStart;

  ///Set to `true` to have all the browser's cache cleared before the new WebView is opened. The default value is `false`.
  bool clearCache;

  ///Sets the user-agent for the WebView.
  ///
  ///**NOTE**: available on iOS 9.0+.
  String userAgent;

  ///Append to the existing user-agent. Setting userAgent will override this.
  ///
  ///**NOTE**: available on Android 17+ and on iOS 9.0+.
  String applicationNameForUserAgent;

  ///Set to `true` to enable JavaScript. The default value is `true`.
  bool javaScriptEnabled;

  ///Set to `true` to allow JavaScript open windows without user interaction. The default value is `false`.
  bool javaScriptCanOpenWindowsAutomatically;

  ///Set to `true` to prevent HTML5 audio or video from autoplaying. The default value is `true`.
  ///
  ///**NOTE**: available on iOS 10.0+.
  bool mediaPlaybackRequiresUserGesture;

  ///Sets the minimum font size. The default value is `8` for Android, `0` for iOS.
  int? minimumFontSize;

  ///Define whether the vertical scrollbar should be drawn or not. The default value is `true`.
  bool verticalScrollBarEnabled;

  ///Define whether the horizontal scrollbar should be drawn or not. The default value is `true`.
  bool horizontalScrollBarEnabled;

  ///List of custom schemes that the WebView must handle. Use the [WebView.onLoadResourceCustomScheme] event to intercept resource requests with custom scheme.
  ///
  ///**NOTE**: available on iOS 11.0+.
  List<String> resourceCustomSchemes;

  ///List of [ContentBlocker] that are a set of rules used to block content in the browser window.
  ///
  ///**NOTE**: available on iOS 11.0+.
  List<ContentBlocker> contentBlockers;

  ///Sets the content mode that the WebView needs to use when loading and rendering a webpage. The default value is [UserPreferredContentMode.RECOMMENDED].
  ///
  ///**NOTE**: available on iOS 13.0+.
  UserPreferredContentMode? preferredContentMode;

  ///Set to `true` to be able to listen at the [WebView.shouldInterceptAjaxRequest] event. The default value is `false`.
  bool useShouldInterceptAjaxRequest;

  ///Set to `true` to be able to listen at the [WebView.shouldInterceptFetchRequest] event. The default value is `false`.
  bool useShouldInterceptFetchRequest;

  ///Set to `true` to open a browser window with incognito mode. The default value is `false`.
  ///
  ///**NOTE**: available on iOS 9.0+.
  ///On Android, by setting this option to `true`, it will clear all the cookies of all WebView instances,
  ///because there isn't any way to make the website data store non-persistent for the specific WebView instance such as on iOS.
  bool incognito;

  ///Sets whether WebView should use browser caching. The default value is `true`.
  ///
  ///**NOTE**: available on iOS 9.0+.
  bool cacheEnabled;

  ///Set to `true` to make the background of the WebView transparent. If your app has a dark theme, this can prevent a white flash on initialization. The default value is `false`.
  bool transparentBackground;

  ///Set to `true` to disable vertical scroll. The default value is `false`.
  bool disableVerticalScroll;

  ///Set to `true` to disable horizontal scroll. The default value is `false`.
  bool disableHorizontalScroll;

  ///Set to `true` to disable context menu. The default value is `false`.
  bool disableContextMenu;

  ///Set to `false` if the WebView should not support zooming using its on-screen zoom controls and gestures. The default value is `true`.
  bool supportZoom;

  ///Sets whether cross-origin requests in the context of a file scheme URL should be allowed to access content from other file scheme URLs.
  ///Note that some accesses such as image HTML elements don't follow same-origin rules and aren't affected by this setting.
  ///
  ///Don't enable this setting if you open files that may be created or altered by external sources.
  ///Enabling this setting allows malicious scripts loaded in a `file://` context to access arbitrary local files including WebView cookies and app private data.
  ///
  ///Note that the value of this setting is ignored if the value of [allowUniversalAccessFromFileURLs] is `true`.
  ///
  ///The default value is `false`.
  bool allowFileAccessFromFileURLs;

  ///Sets whether cross-origin requests in the context of a file scheme URL should be allowed to access content from any origin.
  ///This includes access to content from other file scheme URLs or web contexts.
  ///Note that some access such as image HTML elements doesn't follow same-origin rules and isn't affected by this setting.
  ///
  ///Don't enable this setting if you open files that may be created or altered by external sources.
  ///Enabling this setting allows malicious scripts loaded in a `file://` context to launch cross-site scripting attacks,
  ///either accessing arbitrary local files including WebView cookies, app private data or even credentials used on arbitrary web sites.
  ///
  ///The default value is `false`.
  bool allowUniversalAccessFromFileURLs;

  InAppWebViewOptions(
      {this.useShouldOverrideUrlLoading = false,
      this.useOnLoadResource = false,
      this.useOnDownloadStart = false,
      this.clearCache = false,
      this.userAgent = "",
      this.applicationNameForUserAgent = "",
      this.javaScriptEnabled = true,
      this.javaScriptCanOpenWindowsAutomatically = false,
      this.mediaPlaybackRequiresUserGesture = true,
      this.minimumFontSize,
      this.verticalScrollBarEnabled = true,
      this.horizontalScrollBarEnabled = true,
      this.resourceCustomSchemes = const [],
      this.contentBlockers = const [],
      this.preferredContentMode = UserPreferredContentMode.RECOMMENDED,
      this.useShouldInterceptAjaxRequest = false,
      this.useShouldInterceptFetchRequest = false,
      this.incognito = false,
      this.cacheEnabled = true,
      this.transparentBackground = false,
      this.disableVerticalScroll = false,
      this.disableHorizontalScroll = false,
      this.disableContextMenu = false,
      this.supportZoom = true,
      this.allowFileAccessFromFileURLs = false,
      this.allowUniversalAccessFromFileURLs = false}) {
    if (this.minimumFontSize == null)
      this.minimumFontSize =
          defaultTargetPlatform == TargetPlatform.android ? 8 : 0;
    assert(!this.resourceCustomSchemes.contains("http") &&
        !this.resourceCustomSchemes.contains("https"));
  }

  @override
  Map<String, dynamic> toMap() {
    List<Map<String, Map<String, dynamic>>> contentBlockersMapList = [];
    contentBlockers.forEach((contentBlocker) {
      contentBlockersMapList.add(contentBlocker.toMap());
    });

    return {
      "useShouldOverrideUrlLoading": useShouldOverrideUrlLoading,
      "useOnLoadResource": useOnLoadResource,
      "useOnDownloadStart": useOnDownloadStart,
      "clearCache": clearCache,
      "userAgent": userAgent,
      "applicationNameForUserAgent": applicationNameForUserAgent,
      "javaScriptEnabled": javaScriptEnabled,
      "javaScriptCanOpenWindowsAutomatically":
          javaScriptCanOpenWindowsAutomatically,
      "mediaPlaybackRequiresUserGesture": mediaPlaybackRequiresUserGesture,
      "verticalScrollBarEnabled": verticalScrollBarEnabled,
      "horizontalScrollBarEnabled": horizontalScrollBarEnabled,
      "resourceCustomSchemes": resourceCustomSchemes,
      "contentBlockers": contentBlockersMapList,
      "preferredContentMode": preferredContentMode?.toNativeValue(),
      "useShouldInterceptAjaxRequest": useShouldInterceptAjaxRequest,
      "useShouldInterceptFetchRequest": useShouldInterceptFetchRequest,
      "incognito": incognito,
      "cacheEnabled": cacheEnabled,
      "transparentBackground": transparentBackground,
      "disableVerticalScroll": disableVerticalScroll,
      "disableHorizontalScroll": disableHorizontalScroll,
      "disableContextMenu": disableContextMenu,
      "supportZoom": supportZoom,
      "allowFileAccessFromFileURLs": allowFileAccessFromFileURLs,
      "allowUniversalAccessFromFileURLs": allowUniversalAccessFromFileURLs
    };
  }

  static InAppWebViewOptions fromMap(Map<String, dynamic> map) {
    List<ContentBlocker> contentBlockers = [];
    List<dynamic>? contentBlockersMapList = map["contentBlockers"];
    if (contentBlockersMapList != null) {
      contentBlockersMapList.forEach((contentBlocker) {
        contentBlockers.add(ContentBlocker.fromMap(
            Map<String, Map<String, dynamic>>.from(
                Map<String, dynamic>.from(contentBlocker))));
      });
    }

    var instance = InAppWebViewOptions();
    instance.useShouldOverrideUrlLoading = map["useShouldOverrideUrlLoading"];
    instance.useOnLoadResource = map["useOnLoadResource"];
    instance.useOnDownloadStart = map["useOnDownloadStart"];
    instance.clearCache = map["clearCache"];
    instance.userAgent = map["userAgent"];
    instance.applicationNameForUserAgent = map["applicationNameForUserAgent"];
    instance.javaScriptEnabled = map["javaScriptEnabled"];
    instance.javaScriptCanOpenWindowsAutomatically =
        map["javaScriptCanOpenWindowsAutomatically"];
    instance.mediaPlaybackRequiresUserGesture =
        map["mediaPlaybackRequiresUserGesture"];
    instance.verticalScrollBarEnabled = map["verticalScrollBarEnabled"];
    instance.horizontalScrollBarEnabled = map["horizontalScrollBarEnabled"];
    instance.resourceCustomSchemes =
        List<String>.from(map["resourceCustomSchemes"] ?? []);
    instance.contentBlockers = contentBlockers;
    instance.preferredContentMode =
        UserPreferredContentMode.fromNativeValue(map["preferredContentMode"]);
    instance.useShouldInterceptAjaxRequest =
        map["useShouldInterceptAjaxRequest"];
    instance.useShouldInterceptFetchRequest =
        map["useShouldInterceptFetchRequest"];
    instance.incognito = map["incognito"];
    instance.cacheEnabled = map["cacheEnabled"];
    instance.transparentBackground = map["transparentBackground"];
    instance.disableVerticalScroll = map["disableVerticalScroll"];
    instance.disableHorizontalScroll = map["disableHorizontalScroll"];
    instance.disableContextMenu = map["disableContextMenu"];
    instance.supportZoom = map["supportZoom"];
    instance.allowFileAccessFromFileURLs = map["allowFileAccessFromFileURLs"];
    instance.allowUniversalAccessFromFileURLs =
        map["allowUniversalAccessFromFileURLs"];
    return instance;
  }

  @override
  Map<String, dynamic> toJson() {
    return this.toMap();
  }

  @override
  String toString() {
    return toMap().toString();
  }

  @override
  InAppWebViewOptions copy() {
    return InAppWebViewOptions.fromMap(this.toMap());
  }
}
