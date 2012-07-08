//
//  BoCPressConstant.h
//  BoCPress
//
//  Created by LeixSnake on 6/9/11.
//  Copyright 2011 SJTU. All rights reserved.
//
#pragma mark - notification name defines

#define kSoapDataSource_loadConfiguration @"kSoapDataSource_loadConfiguration"

#define kNetworkManager_postRequestNotification @"BoCPressNetworkService_postRequest"

#define kSoapDataSource_notificationForGetImage @"kSoapDataSource_notificationForGetImage"

#define kBoCPress_Global_EGOViewControllerWantToBeDismissed @"kBoCPress_Global_EGOViewControllerWantToBeDismissed"

#pragma mark - get Post List defines

#define kNetwork_GetPostListResponse @"getPostListResponse"

#define kNetwork_GetPostList @"getPostList"

#pragma mark - get post defines

#define kNetwork_GetPost @"getPost"

#define kNetwork_GetPostResponse @"getPostResponse"

#define kNetwork_GetPostRequestString @"<postId>%@</postId>"

#pragma mark - get author defines

#define kNetwork_GetAuthorResponse @"getAuthorResponse"

#define kNetwork_GetAuthor @"getAuthor"

#define kNetwork_GetAuthorFormatterString @"<authorId>%@</authorId>"

#define kNetwork_ReturnedInfoOfAuthor @"kNetwork_ReturnedInfoOfAuthor"

#pragma mark - get user info

#define kNetwork_getUserInfoRequest @"getUserInfo"

#define kNetwork_getUserInfoResponse @"getUserInfoResponse"

#define kCallbackAction_updateUserInfo @"kCallbackAction_updateUserInfo"

#pragma mark - set Comment

#define kNetwork_SetComment @"setComment"

#define kNetwork_SetCommentResponse @"setCommentResponse"

#define kNetwork_GetQuoteList @"getQuoteList"

#define kNetwork_GetQuoteDetail @"getQuoteDetail"

#define kNetwork_GetQuoteListResponse @"getQuoteListResponse"

#define kNetwork_SoapResponseType @"soapResponseType"

#define kNetworkManager_TargetURL @"targetURL"

#define kNetwork_GetOpinionList @"getOpinionList"

#define kNetwork_GetOpinionListResponse @"getOpinionListResponse"

#define kNetwork_GetSubColumnPostList    @"getSubColumnPostList"

#define kNetwork_GetSubColumnPostListResponse @"getSubColumnPostListResponse"

#define kNetworkManager_RequestString @"requestString"

#pragma mark - set comment

#define kNetwork_SetCommentString   @"<postId>%@</postId><rating>%i</rating>"

#pragma mark - get configuration

#define kNetwork_getConfiguration  @"getConfiguration"

#define kNetwork_getConfigurationResponse @"getConfigurationResponse"

#pragma mark - get quoteContent

#define kNetwork_getQuoteContent @"getQuoteContent"

#define kNetwork_getQuoteContentResponse @"getQuoteContentResponse"

#define kNetwork_getQuoteDetailResponse @"getQuoteDetailResponse"

#define kCallbackAction_contentOfQuoteDetail @"kCallbackAction_contentOfQuoteDetail"

#define kType_Global_SecurityFamily @"kType_Global_SecurityFamily"

#pragma mark - get splash advertisement

#define kNetwork_getSplashAds @"getSplashAds"

#define kNetwork_getSplashAdsResponse @"getSplashAdsResponse"

#define kCallbackAction_getSplashAds @"kCallbackAction_getSplashAds"

#pragma mark - get chart

#define kNetwork_getChart @"getChart"

#define kNetwork_getChartResponse @"getChartResponse"

#define kCallbackAction_getChartImageWithImageConfiguration @"kCallbackAction_getChartImageWithImageConfiguration"

#define kNetwork_getChartFormatterString @"<secId>%@</secId><width>%@</width><height>%@</height><type>%@</type><analyses>%@</analyses><interval>%@</interval><points>%@</points>"

#define kBoCPress_Global_ChartImageConfigurationObject @"kBoCPress_Global_ChartImageConfigurationObject"

#pragma mark - regular define of network

#define kNetwork_FileType @"kNetwork_FileType"

#define kNetwork_SingleIdentifiedObject @"kNetwork_SingleIdentifiedObject"

#define kNetwork_RangedIdentifiedObject @"kNetwork_RangedIdentifiedObject"

#define kNetwork_UserInfo @"kNetwork_UserInfo"

#define kNetwork_CallbackAction @"callbackAction"

#define kString_QuoteContentPage_TriggerFlag @"kString_QuoteContentPage_TriggerFlag"

#define kNetwork_CallbackObject @"callbackObject"

#define kNetwork_SoapXMLParserDelegate @"kNetwork_SoapXMLParserDelegate"

#define kNetwork_CallbackArgument @"kNetwork_CallbackArgument"

#define kObject_RemoteNotification_NewDeadLine @"kObject_RemoteNotification_NewDeadLine"

#define kNetwork_ConnectionError @"kNetwork_ConnectionError"

#define kCallbackAction_tryWithPreviousCallbackActionAgainAfterServerError @"kCallbackAction_tryWithPreviousCallbackActionAgainAfterServerError"

#define kNetwork_CallbackStoredCallbackInfo @"kNetwork_CallbackStoredCallbackInfo"

#define kConfiguration_QueryTag @"kConfiguration_QueryTag"

#define kNetworkManager_responsedData @"BoCPressNetworkService_responsedData"

#define kNetwork_RangeFrom @"rangeFrom"

#define kNetwork_RangeTo @"rangeTo"

#define kNetwork_SliceCount @"kNetwork_SliceCount"

#define kNetwork_NewsTag @"newsTag"

#define kNetwork_MediaType kType_Global_MediaTypeObject

#define kNetwork_GetAuthorList @"getAuthorList"

#define kNetwork_GetAuthorListResponse @"getAuthorListResponse"

#define kNetwork_MaxNewsCount (1000)


//seconds here, default 10 seconds
#define kDataSource_CacheInvalidTimeInterval (10)

#define kNetwork_DateFormatterString @"yyyy-MM-dd HH:mm:ss"

#pragma mark - BroadCast CallbackActions

#define kBroadCastColumnID @"101013"

#define kNetwork_GetBroadcastLiving @"getBroadcastLiving"

#define kNetwork_GetBroadcastLivingResponse @"getBroadcastLivingResponse"

#define kNetwork_GetBroadcastLivingRequestFormatterString @"<columnId>%@</columnId>"

#define kNetwork_GetBroadcastForecast @"getBroadcastForecast"

#define kNetwork_GetBroadcastForecastResponse @"getBroadcastForecastResponse"

#define kCallbackAction_listOrderedBroadCastForcast @"kCallbackAction_listOrderedBroadCastForcast"

#define kCallbackAction_contentOfBroadCast @"contentOfBroadCast"

#define kCallbackAction_currentBroadCastWithCallback @"currentBroadCastWithCallback"

#define kCallbackAction_listOrderedPostsFromCritic @"listOrderedPostsFromCritic"

#pragma mark - get media

#define kCallbackAction_listOrderedMediaTypes @"kCallbackAction_listOrderedMediaTypes"

#define kCallbackAction_listOrderedMediaTagsInType @"listOrderedMediaTagsInType"

#define kCallbackAction_listOrderedMediaWithTag @"listOrderedMediaWithTag"

#define kCallbackAction_listOrderedMediaOfType @"listOrderedMediaOfType"

#define kCallbackAction_contentOfMedia @"contentOfMedia"

#define kBoCPress_Global_MediaObject @"kBoCPress_Global_MediaObject"

#define kBoCPress_Global_ObjectID @"kBoCPress_Global_ObjectID"

#pragma mark - get news

#define kCallbackAction_listOrderedNewsTags @"listOrderedNewsTags"

#define kCallbackAction_listOrderedNewsWithTag @"listOrderedNewsWithTag"

#define kCallbackAction_contentOfNews @"contentOfNews"

#pragma mark - get ads

#define kNetwork_getAds @"getAds"

#define kNetwork_getAdsResponse @"getAdsResponse"

#define kCallbackAction_getAds @"kCallbackAction_getAds"

#define kCallbackAction_handleTimeOutEventOfGetAds @"kCallbackAction_handleTimeOutEventOfGetAds"

#pragma mark - get post

#define kCallbackAction_listOrderedCriticColumns @"kCallbackAction_listOrderedCriticColumns"

#define kCallbackAction_listOrderedCritics @"kCallbackAction_listOrderedCritics"

#define kCallbackAction_listOrderedFavoriteCritics @"kCallbackAction_listOrderedFavoriteCritics"

#define kCallbackAction_listLatestCriticPost @"kCallbackAction_listLatestCriticPost"

#define kCallbackAction_contentOfCriticPost @"contentOfCriticPost"

#pragma mark - long term

#define kCallbackAction_listOrderedLongTermSecurityInFamily @"listOrderedLongTermSecurityInFamily"

#define kCallbackAction_listOrderedSecurityFamilies @"listOrderedSecurityFamilies"

#define kCallbackAction_listOrderedSecurityInFamily @"listOrderedSecurityInFamily"

#define kString_Global_UpdateTriggerFlagByTimer @"TIMER_TRIGGER"

#define kString_Global_UpdateTriggerFlagByUser @"USER_TRIGGER"

#pragma mark - FeedBack 

#define kNetwork_GetCommentSummary @"getCommentSummary"

#define kNetwork_GetCommentSummaryResponse @"getCommentSummaryResponse"

#define kNetwork_GetCommnetSummaryRequestFormatterString @"<postId>%@</postId>"

#define kCallbackAction_getCommentSummaryContentOfNews @"getCommentSummaryContentOfNews"

#define kCommentSummary_PostAverageRateing @"kCommentSummary_PostAverageRateing"

#define kCommentSummary_PostRateCount @"kCommentSummary_PostRateCount"

#define kCommentSummary_PostID @"kCommentSummary_PostID"

#pragma mark - Get Help Info

#define kNetwork_GetHelpInfoFormatterString @"<columnId>%@</columnId>"

#define kNetwork_GetHelpInfo @"getHelpInfo"

#define kNetwork_GetHelpInfoResponse @"getHelpInfoResponse"

#define kCallbackAction_getHelpInfoOfColumn @"kCallbackAction_getHelpInfoOfColumn"

#define kGetHelpInfoContent @"kGetHelpInfoContent"

#define kBoCPress_Global_HelpPageColumnID @"9011"

#define kBoCPress_Global_AboutPageColumnID @"9010"

#define kBoCPress_Global_ProtocolPageColumnID @"9013"

#pragma mark - user feed back

#define kNetwork_SetFeedBack @"setFeedback"

#define kNetwork_SetFeedBackResponse @"setFeedbackResponse"

#define kCallbackAction_submitFeedback @"submitFeedback"

#define kCallbackAction_submitUserFeedback @"kCallbackAction_submitUserFeedback"

#define kNetwork_SetFeedBackFormatterString @"<rsvdStr1>%@</rsvdStr1>"

#define kNetwork_SetUserFeedBackReturnContent @"kNetwork_SetUserFeedBackReturnContent"

#define kBoCPress_View_FeedbackPageWillBrowseBackwardAlertString @"反馈内容尚未提交，确定要返回？"

#pragma mark - login

#define kNetwork_userLoginRequest @"login"

#define kNetwork_userLoginResponse @"loginResponse"

#define kCallbackAction_userLogin @"kCallbackAction_userLogin"

#pragma mark - logout

#define kNetwork_userLogoutRequest @"logout"

#define kNetwork_userLogoutResponse   @"logoutResponse"

#define kCallbackAction_userLogout @"kCallbackAction_userLogout"

#pragma mark -  register

#define kNetwork_NormalAccountRegister @"register"

#define kNetwork_NormalAccountRegisterResponse @"registerResponse"

#define kNetwork_ErrorResponse @"Fault"

#define kCallbackAction_registerNormalAccount @"kCallbackAction_registerNormalAccount"

#define kBoCPress_Global_ResponseStatus @"kBoCPress_Global_ResponseStatus"

#define kBoCPress_Global_ServerErrorMessage_CN @"kBoCPress_Global_ServerErrorMessage_CN"

#define kBoCPress_Global_ServerErrorMessage_EN @"kBoCPress_Global_ServerErrorMessage_EN"

#define kBoCPress_Global_ServerErrorCode @"kBoCPress_Global_ServerErrorCode"

#pragma mark - get protocol content

#define kNetwork_getPromptMsg @"getPromptMsg"

#define kNetwork_getPromptMsgResponse @"getPromptMsgResponse"

#define kCallbackAction_getPromptMsg @"kCallbackAction_getPromptMsg"

#define kGlobal_ProtocolContent @"kGlobal_ProtocolContent"

#pragma mark - find password

#define kNetwork_FindUserPasswordRequest @"resetPassword"

#define kNetwork_FindUserPasswordResponse @"resetPasswordResponse"

#define kCallbackAction_findUserPassword @"kCallbackAction_findUserPassword"

#pragma mark - change password

#define kNetwork_ChangeUserPassword @"changePassword"

#define kNetwork_ChangeUserPasswordResponse @"changePasswordResponse"

#define kCallbackAction_changeUserPassword @"kCallbackAction_changeUserPassword"

#pragma mark - active code

#define kNetwork_ActivateCodeRequest @"activateCode"

#define kNetwork_ActivateCodeResponse @"activateCodeResponse"

#define kCallbackAction_activateCode @"kCallbackAction_activateCode"


#pragma mark - purchase
#define kCallbackAction_listOrderedCards @"kCallbackAction_listOrderedCards"

#define kNetwork_getFeeSchedule @"getFeeSchedule"

#define kNetwork_getFeeScheduleResponse @"getFeeScheduleResponse"

#define kBoCPress_Global_ProductId @"com.eintsoft.TestBoCPress.BoCPressUpgrade"

#define kBoCPress_TransactionSucceededNotification @"kBoCPress_TransactionSucceededNotification"

#define kBoCPress_TransactionFailedNotification @"kBoCPress_TransactionFailedNotification"

#define kBoCPress_TransactionCanceledNotification @"kBoCPress_TransactionCanceledNotification"

#define kViewController_wantToShowVIPActivateCodePage @"kViewController_wantToShowVIPActivateCodePage"

#define kViewController_wantToShowBuyCardPage @"kViewController_wantToShowBuyCardPage"

#define kNetwork_createPurchaseOrderRequest @"createPurchaseOrder"

#define kNetwork_createPurchaseOrderResponse @"createPurchaseOrderResponse"

#define kCallbackAction_createPurchaseOrder @"kCallbackAction_createPurchaseOrder"

#define kPurchaseManager_OrderCode @"kPurchaseManager_OrderCode"

#define kNetwork_requestPurchase @"requestPurchase"

#define kNetwork_requestPurchaseResponse @"requestPurchaseResponse"

#define kCallbackAction_requestPurchase @"kCallbackAction_requestPurchase"

#pragma mark - verify receipt

#define kNetwork_verifyReceipt @"verifyReceipt"

#define kNetwork_verifyReceiptResponse @"verifyReceiptResponse"

#define kNetwork_verifyreceiptFormatterString @"<rsvdStr1>%@</rsvdStr1>"

#define kCallbackAction_verifyreceipt @"kCallbackAction_verifyreceipt"

#pragma mark - view defines

#define kLatestCriticsID @"4014"

#define kOrderedCriticsID @"4012"

#define kFavoriteCriticsID @"4015"

#define kLatestCriticsType @"1003"

#define kHotestCriticsType @"1004"

#define kDefaultFontSize (100.0)

#define kMaxFontSizeMultiple (2.5)

#define kMinFontSizeMultiple (0.5)

#define kFeedBackTitle @"评价"

#define kFeedBackContentString @"%i份评价的平均分:%i"

#define kBoCPressViewController_wantToShowFeedBackView @"kBoCPressViewController_wantToShowFeedBackView"

#define kBoCPressNewsPage_wantToShowFeedBackView @"kBoCPressNewsPage_wantToShowFeedBackView"

#define kBoCPressViewControllerPrivateHandler_notificationForShowFeedBackView @"kBoCPressViewControllerPrivateHandler_notificationForShowFeedBackView"

#define kBoCPressViewControllerPrivateHandler_notificationForRemoveFeedBackView @"kBoCPressViewControllerPrivateHandler_notificationForRemoveFeedBackView"

#define kBoCPressViewControllerPrivateHandler_notificationForRecoverBackgroudColor @"kBoCPressViewControllerPrivateHandler_notificationForRecoverBackgroudColor"

#define kViewController_wantToStepToRefreshCurrentPage @"kViewController_wantToStepToRefreshCurrentPage"


#define kBoCPressViewControllerPrivateHandler_notificationForRotateView @"kBoCPressViewControllerPrivateHandler_notificationForRotateView"

#define kBoCPressViewControllerPrivateHandler_notificationForPlayMedia @"kBoCPressViewControllerPrivateHandler_notificationForPlayMedia"

#define kViewController_didRefreshToTab @"kViewController_didRefreshToTab"

#define kViewController_couldBrowseBackward @"kViewController_couldBrowseBackward"

#define kViewController_wantToPlayMedia @"kViewController_wantToPlayMedia"

#define kViewController_wantToReadNews_inNewsList @"kViewController_wantToReadNews_inNewsList"

#define kViewController_wantToReadLongTermListOfSecurityInFamily @"kViewController_wantToReadLongTermListOfSecurityInFamily"

#define kViewController_wantToReadListOfSecurityInFamily @"kViewController_wantToReadListOfSecurityInFamily"

#define kViewController_wantToReadListOfNews @"kViewController_wantToReadListOfNews"

#define kViewController_wantToReadListOfMediaType @"kViewController_wantToReadListOfMediaType"

#define kViewController_didSwitchToTab @"kViewController_didSwitchToTab"

#define kViewController_didSlideToPage @"kViewController_didSlideToPage"

#define kViewController_didBrowseBackwardToPage @"kViewController_didBrowseBackwardToPage"

#define kViewController_updateNavigationBar @"kViewController_updateNavigationBar"

#define kViewController_wantoToShowAccountLoginPage @"kViewController_wantoToShowAccountLoginPage"

#define kViewController_didUpdateDataOfCurrentPageWhenServerError @"kViewController_didUpdateDataOfCurrentPageWhenServerError"

#define  kViewController_wantoToShowAccountLoginPageWithCallbackInfo @"kViewController_wantoToShowAccountLoginPageWithCallbackInfo"

#define kViewController_wantToShowVIPAccountRegisterPageWithCallbackInfo @"kViewController_wantToShowVIPAccountRegisterPageWithCallbackInfo"

#define kViewController_wantToShowUserInfoPage @"kViewController_wantToShowUserInfoPage"

#define kViewController_wantToReadHelpPage @"kViewController_wantToReadHelpPage"

#define kViewController_wantToReadAboutPage @"kViewController_wantToReadAboutPage"

#define kViewController_wantToReadProtocolPage @"kViewController_wantToReadProtocolPage"

#define kViewController_wantoShowUserFeedbackPage @"kViewController_wantoShowUserFeedbackPage"

#define kNotification_Global_didEnterForeground @"kNotification_Global_didEnterForeground"

#define kViewController_wantToUpdateCurrentPage @"kViewController_wantToUpdateCurrentPage"

#define kViewController_wantToShowChangePasswordPage @"kViewController_wantToShowChangePasswordPage"

#define kViewController_wantToShowActivateCodePage @"kViewController_wantToShowActivateCodePage"

#define kBoCPressCallBackValid  YES
#define kBoCPressCallBackInvalid NO

#define kBoCPressIsNews @"kBoCPressIsNews"
#define kBoCPressIsCriticPost @"kBoCPressIsCriticPost"

#define kExchangeRateType @"kExchangeRateType"

#define kBoCPressSecurityFamilyType @"kBoCPressSecurityFamilyType"

#define kBoCPressHelpString @"<html><h2>帮助</h2></html>"

#define kBoCPressAboutString @"<html><h2>关于</h2></html>"

#define kNetwork_HasMoreContent @"kNetwork_HasMoreContent"



#pragma mark - BoCPressMediaPlayer defines

#define kMediaPlayer_CheckMediaPlayerStateTimeInterval (0.1)

#define kMediaPlayer_TimeOutInterval (10)

#define kMediaPlayer_NetworkTimeOutErrorMessageTitle @"错误"

#define kMediaPlayer_NetworkTimeOutErrorMessageContent @"网络超时"

#define kMediaPlayer_UIAlertViewCancelButtonString @"确定"

#define kMediaPlayer_UIAlerViewDefaultMessage @"Unknow Button checked in UIAlertView" 

#define kMediaPlayer_NotificationMediaPlayFinished @"kMediaPlayer_NotificationMediaPlayFinished"


#pragma mark - Cache defines

//default 5 minutes
//
#define kCache_InvalidateTimeInterval (60 * 5)

#define kCache_TimeStamp @"kCache_TimeStamp"

#define kNetwork_CriticID @"kNetwork_CriticID"

#define kNetwork_UserInfoOfCallback "kNetwork_UserInfoOfCallback"

#define kNetwork_CriticPostID @"kNetwork_CriticPostID"

#define kNetwork_MediaTypeID @"kNetwork_MediaTypeID"

#define kNetwork_NewsTagID @"kNetwork_NewsTagID"


#define kBoCPress_View_VedioMediaTypeID @"1010"

#define kkBoCPress_View_AudioMediaTypeID @"1011"


#define kDefaultTextFontSize (100)

#define kTextFontSizeMultiple (1.2)

#define kMaxTextFontSize (kDefaultTextFontSize * kTextFontSizeMultiple * kTextFontSizeMultiple * kTextFontSizeMultiple)

#define kMinTextFontSize (kDefaultTextFontSize / (kTextFontSizeMultiple * kTextFontSizeMultiple * kTextFontSizeMultiple))

#define kNetwork_UpdateTime @"kNetwork_UpdateTime"

#define kSoapXMLParser_quoteDate @"quoteDate"

#define kCriticPost_NoDeeper @"kCriticPost_NoDeeper"

#define kCriticPost_HasDeeper @"kCriticPost_HasDeeper"

#define kCriticPost_CriticPostPageFlag @"kCriticPost_CriticPostPageFlag"

#define kCriticPost_CriticIdentity @"kCriticPost_CriticIdentity"

#define kViewController_wantToReadCriticPost_inPostList_pageFlag_    @"wantToReadCriticPostinPostListpageFlag"

#define kCriticView_ShowTriangleNavigateLogo @"kCriticView_ShowTriangleNavigateLogo"

#define kCriticView_HideTriangleNavigateLogo @"kCriticView_HideTriangleNavigateLogo"

#define kViewController_wantToReadListOfCriticPost @"wantToReadListOfCriticPost"

#define kSoapXMLParser_HasNextFlag @"hasNext"

#define kSoapXMLParser_HasNextFalse @"false"

#define kArraySliceMaxCount NSNotFound

#define kFeedBack_HasCommentedNews @"1"

#define kSoapXMLParser_NewsCommentRepeatRatingFlag @"repeatRatingFlag"

#define kBoCPress_View_HeaderUpdateTimeLabelFormatterString @"释放可以刷新...\n上次刷新：%i分钟前"

#define kBoCPress_View_HeaderUpdateTimeLabelUpdateTimeMoreThanAnHourString @"释放可以刷新...\n上次刷新：1小时以前"

#define kBoCPress_View_MediaType @"type"
#define kBoCPress_Global_NewsType @"news"
#define kBoCPress_Global_CriticObject @"kBoCPress_Global_CriticObject"

#define kBoCPress_Global_MinutesPerHour (60)

#define kBoCPress_Global_URLConnectionObject @"kBoCPress_Global_URLConnectionObject"

#define kBoCPress_Global_ColumnID @"kBoCPress_Global_ColumnID"
#define kBoCPress_Global_QueryCommand @"kBoCPress_Global_QueryCommand"
#define kBoCPressNewsPage_pageSlideDirection @"kBoCPressNewsPage_pageSlideDirection"
#define kBoCPressNewsPage_pageSlideDirectionPrevious @"kBoCPressNewsPage_pageSlideDirectionPrevious"
#define kBoCPressNewsPage_pageSlideDirectionNext @"kBoCPressNewsPage_pageSlideDirectionNext"
#define kBoCPressNewsPage_pageSlideDirectionNone @"kBoCPressNewsPage_pageSlideDirectionNone"

#define kBoCPress_NavigationBarView_FontSize (23.0)

#define kBoCPress_NavigationBarView_TitleWidth (100.0)

#define kBoCPress_Global_CallbackAction_contentOfCritic @"contentOfCritic"

#define kSoapDataSource_getGUIConfigurationXMLFromURL @"kSoapDataSource_getGUIConfigurationXMLFromURL"

#define kSoapDataSource_refetchGUIConfiguration @"kSoapDataSource_refetchGUIConfiguration"

#define kBoCPress_Global_PageLevelIndex @"kBoCPress_Global_PageLevelIndex"

#define kBoCPressViewControllerPrivateHandler_notificationForWantToReadSubcolumn  @"kBoCPressViewControllerPrivateHandler_notificationForWantToReadSubcolumn"

#define kBoCPress_Global_OrderedKeyArray @"kBoCPress_Global_OrderedKeyArray"

#define kDataSource_getGUIConfiguration @"kDataSource_getGUIConfiguration"

#define kBoCPressSoapDataSourcePrivateHandler_storeAuthorAvatar @"kBoCPressSoapDataSourcePrivateHandler_storeAuthorAvatar"

#define kBoCPress_Global_UIImageObject @"kBoCPress_Global_UIImageObject"

#define kBoCPress_Global_NSURLObject @"kBoCPress_Global_NSURLObject"

#define kBoCPress_Global_NotUseCacheFlag @"kBoCPress_Global_NotUseCacheFlag"

#define kBoCPress_Global_NSStringObject @"kBoCPress_Global_NSStringObject"

#define kType_Global_NSArray @"kType_Global_NSArray"

#define kType_Global_RemoteConfiguration @"kType_Global_RemoteConfiguration"

#define kBoCPress_View_updateThumbnailImage @"kBoCPress_View_updateThumbnailImage"

#define kBoCPressSoapDataSourcePrivateHandler_reloadDataSource @"kBoCPressSoapDataSourcePrivateHandler_reloadDataSource"

#define kBoCPressSoapDataSourcePrivateHandler_handleDownloadReturnedData @"kBoCPressSoapDataSourcePrivateHandler_handleDownloadReturnedData"

#define kBoCPress_Global_ArraySliceObject @"kBoCPress_Global_ArraySliceObject"

#define kBoCPress_Global_MinTimerIntervalForLoadingIndicator (1.5)

#define kBoCPressSoapDataSource_FormerUpdateTime @"kBoCPressSoapDataSource_FormerUpdateTime"

//#define kBoCPressSoapDataSource_CurrentUpdateTime @"kBoCPressSoapDataSource_CurrentUpdateTime"

#pragma mark - configuration

#define kBoCPressConfiguration_MediaTypes @"kBoCPressConfiguration_MediaTypes"

#define kBoCPressConfiguration_CriticColumns @"kBoCPressConfiguration_CriticColumns"

#define kBoCPressConfiguration_NewsSubColumns @"kBoCPressConfiguration_NewsSubColumns"

#define kBoCPressConfiguration_NewsSuperColumns @"kBoCPressConfiguration_NewsSuperColumns"

#define kBoCPressConfiguration_QuoteFamilies @"kBoCPressConfiguration_QuoteFamilies"

#define kBoCPressConfiguration_CurrentVersion @"kBoCPressConfiguration_CurrentVersion"

#define kNetwork_XMLConfigurationString @"kNetwork_XMLConfigurationString"

#pragma mark - database configuration

#define kBoCPress_CacheDatabasePath @"BoCPressCache.sqlite"

#define kViewControllerPrivateHandler_finishedSplash @"kViewControllerPrivateHandler_finishedSplash"

#define kViewController_didLoadGUIConfiguration @"kViewController_didLoadGUIConfiguration"

#define kBoCPress_Global_PageObject @"kBoCPress_Global_PageObject"

#define kCallbackAction_reloadColumnsWithTag @"kCallbackAction_reloadColumnsWithTag"

#define kBocPress_View_wantToGetMoreCritic @"kBocPress_View_wantToGetMoreCritic"

#define kBoCPress_View_HasMoreTag @"kBoCPress_View_HasMoreTag"

#define kBoCPress_Global_NotificationForNetworkTimeOut @"kBoCPress_Global_NotificationForNetworkTimeOut"

#define kBoCPress_View_RefreshArrowAnimationTimeInterval (0.3)

#define kBoCPress_View_LongTermSecurityTimeCount (6)

#define kBoCPress_Global_startToFetchGUIConfiguration @"kBoCPress_Global_startToFetchGUIConfiguration"

#define kBoCPress_Global_LastUpdateSecuritiesTime @"kBoCPress_Global_LastUpdateSecuritiesTime"

#define kBoCPressHasReadMessage @"kBoCPressHasReadMessage"

#define kBoCPress_View_didUpdateDataOfCurrentPage @"kBoCPress_View_didUpdateDataOfCurrentPage"

#define kSecondsCountOfSevenDays (7 * 24 * 60 * 60)

#define kViewController_wantToShowVIPAccountRegisterPage @"kViewController_wantToShowVIPAccountRegisterPage"

#define kViewController_wantToShowNormalAccountRegisterPage @"kViewController_wantToShowNormalAccountRegisterPage"

#define kViewcontroller_wantToShowFindPasswordPage @"kViewcontroller_wantToShowFindPasswordPage"

#define kViewController_wantToSlideToTabAtIndex @"kViewController_wantToSlideToTabAtIndex"

//#define kBoCPress_Network_ImageURLs  @"kBoCPress_Network_ImageURLs"

#define kBoCPress_Global_Index @"kBoCPress_Global_Index"

#define kBoCPress_Global_SecretSalt @"boc_secret%@"


#define kViewController_wantToShowProtocolView @"kViewController_wantToShowProtocolView"

#define kViewController_finishedShowProtocolView @"kViewController_finishedShowProtocolView"

#define kNormalAccountRegister_stepToRegisterNormalAccount @"kNormalAccountRegister_stepToRegisterNormalAccount"

#pragma mark - update place holder file

#define kBoCPress_Global_DatabaseVersionFile @"DatabaseVersion"

#define kViewController_wantToShowVIPAuthorizeSuccessView @"kViewController_wantToShowVIPAuthorizeSuccessView"

#define kViewController_finishedShowVIPAuthorizeSuccessView @"kViewController_finishedShowVIPAuthorizeSuccessView"

#define kBoCPressVIPAuthorizeView_Title @"kBoCPressVIPAuthorizeView_Title"

#define kBoCPressVIPAuthorizeView_Content @"kBoCPressVIPAuthorizeView_Content"

#define kType_GLobal_SecurityObject @"kType_GLobal_SecurityObject"

#define kType_Global_MediaObject @"kType_Global_MediaObject"

#define kType_Global_MediaTypeObject @"kType_Global_MediaTypeObject"

#define kQuoteContentPage_updateDetailImage @"kQuoteContentPage_updateDetailImage"

#define kQuoteContentPage_ChartViewImages @"kQuoteContentPage_ChartViewImages"

#define kBoCPress_Global_MaxTextLengthOfPassword (16)

#define kBoCPress_MessageEffectedVersions @"kBoCPress_MessageEffectedVersions"

#define kBoCPress_Configuration_SolidInfoString @"kBoCPress_Configuration_SolidInfoString"
#define kBoCPress_Configuration_ChannelID @"kBoCPress_Configuration_ChannelID"
#define kBoCPress_Configuration_DeviceName @"kBoCPress_Configuration_DeviceName"
#define kBoCPress_Configuration_DeviceUDID @"kBoCPress_Configuration_DeviceUDID"
#define kBoCPress_Configuration_DeviceModel @"kBoCPress_Configuration_DeviceModel"
#define kBoCPress_Configuration_SystemName @"kBoCPress_Configuration_SystemName"
#define kBoCPress_Configuration_Platform @"kBoCPress_Configuration_Platform"
#define kBoCPress_Configuration_ProductID @"kBoCPress_Configuration_ProductID"
#define kBoCPress_Configuration_SystemVersion @"kBoCPress_Configuration_SystemVersion"
#define kBoCPress_Configuration_SoftwareVersion @"kBoCPress_Configuration_SoftwareVersion"
#define kBoCPress_Configuration_DeviceResolution @"kBoCPress_Configuration_DeviceResolution"
#define kBoCPress_Configuration_HardwarePlatform @"kBoCPress_Configuration_HardwarePlatform"
#define kBoCPress_Configuration_BundleVersion @"kBoCPress_Configuration_BundleVersion"

#define kPurchaseManager_showErrorConnotMakePayments @"kPurchaseManager_showErrorConnotMakePayments"

#define kBoCPress_Configuration_NetworkStatus @"kBoCPress_Configuration_NetworkStatus"

#define kBoCPress_GLobal_SellPrice @"kBoCPress_GLobal_SellPrice"

#define kNetwork_backwardSignleImageView @"kNetwork_backwardSignleImageView"

#define kQuoteContentPage_didFinishedConfiguration @"kQuoteContentPage_didFinishedConfiguration"

#define kSoapConfiguration_SoapXMLTemplateString @"kSoapConfiguration_SoapXMLTemplateString"

#define kQuoteContentPage_showConfigurationView @"kQuoteContentPage_showConfigurationView"

#define kNavigationBarView_showConfigurationView @"kNavigationBarView_showConfigurationView"

#define kQuoteContentPage_showSecurityChooseView @"kQuoteContentPage_showSecurityChooseView"

#define kNavigationBarView_showSecurityChooseView @"kNavigationBarView_showSecurityChooseView"

#define kNavigationBarView_updatePageTitle @"kNavigationBarView_updatePageTitle"

#define kBoCPress_Global_InfoForCache @"kBoCPress_Global_InfoForCache"

#define kViewController_wantToShowLandscapeQuoteContentPage @"kViewController_wantToShowLandscapeQuoteContentPage"

#define kBoCPress_Data_Datasource @"kBoCPress_Data_Datasource"

#define kCallbackAction_listOrderedProductIDs @"kCallbackAction_listOrderedProductIDs"

#define kCallbackAction_listOrderedProductContentInfo  @"kCallbackAction_listOrderedProductContentInfo"

#define kUserInfo_PAY_END_DATE @"PAY_END_DATE"

#define kCallbackAction_handleServerError @"kCallbackAction_handleServerError"

#define kPurchaseManager_transactionReceipt @"kPurchaseManager_transactionReceipt"

#define kSoapConfiguration_ApplicationDocumentDirectory @"kSoapConfiguration_ApplicationDocumentDirectory"

#define kSoapConfiguration_ImageCacheDirectory @"kSoapConfiguration_ImageCacheDirectory"

#define kSoapConfiguration_ApplicationVersionFile @"kSoapConfiguration_ApplicationVersionFile"

#define kSoapConfiguration_ApplicationActionType @"kSoapConfiguration_ApplicationActionType"

#define kViewState_currentTabIdentity @"kViewState_currentTabIdentity"

#define kMediaPlayer_notificationForCancelMediaLoading @"kMediaPlayer_notificationForCancelMediaLoading"

#define kViewController_showMediaPlayer @"kViewController_showMediaPlayer"

#define kAppStore_boc_enable_email_as_account @"boc_enable_email_as_account"

#define kAppStore_boc_enable_coupon_function @"boc_enable_coupon_function"

#define kMediaPlayer_didBeenDismissed @"kMediaPlayer_didBeenDismissed"

#define kBuyCard_productCode @"kBuyCard_productCode"

#define kPromptMessage_Register @"boc_prompt_msg_register_agreement"

#define kPromptMessage_ActivateCode @"boc_prompt_msg_boc_vip_present_instruction"

#define kPromptMessage_VIPService @"boc_prompt_msg_vip_service_instruction"

#define kPurchaseManager_ErrorCode_ReceiptAlreadyProcessed @"30052"

#define kPurchaseManager_ErrorCode_UpdateUserInfoFailed @"30050"

#define kNotification_Global_seteUserInteraction @"kNotification_Global_seteUserInteraction"

#define kBoCPress_Global_UserInteractionState @"kBoCPress_Global_UserInteractionState"

#define kNotification_Global_willBecomeDeactive @"kNotification_Global_willBecomeDeactive"

#define kNetwork_getQuoteRelatedNewsList @"getQuoteRelatedNewsList"

#define kNetwork_getQuoteRelatedNewsListResponse @"getQuoteRelatedNewsListResponse"

#define kCallbackAction_getQuoteRelatedNewsList @"kCallbackAction_getQuoteRelatedNewsList"

#define kNetwork_getQuoteRelatedOpinionsList @"getQuoteRelatedOpinionsList"

#define kNetwork_getQuoteRelatedOpinionsListResponse @"getQuoteRelatedOpinionsListResponse"

#define kCallbackAction_getQuoteRelatedOpinionsList @"kCallbackAction_getQuoteRelatedOpinionsList"

#define kSecurityChooseViewController_didSelectedEntryAtIndex @"kSecurityChooseViewController_didSelectedEntryAtIndex"

#define kChartView_TimeIntervalToGetChartImage (5.0)

#define kChartView_TimeIntervalToStepToGetChartImage (5.0)


#define kBoCPress_SecendsOfADay (24 * 60 * 60)

//#define kBoCPress_CriticPostColumnName  @"kBoCPress_CriticPostColumnName"

#define kQuoteListPage_IsNotTradableString @"0"

#define kQuoteListPage_IsTradableString @"1"

#define kQuoteListPage_IsNotAvaliableString @"2"

#define  kSoapDataSource_loadConfigurationWhenTimeOut @"kSoapDataSource_loadConfigurationWhenTimeOut"

#define kAdvertisementInteraction  @"kAdvertisementInteraction"

#define kAdvertisementClose  @"kAdvertisementClose"

#pragma mark - authorize

#define kCallbackAction_showUserLoginAlertView @"kCallbackAction_showUserLoginAlertView"

#pragma mark - remote notification configuration

#define kSoapDataSource_EnableRemoteNotification @"kSoapDataSource_EnableRemoteNotification"

#define kSoapDataSource_ColumnConfigurationPrefix @"kSoapDataSource_ColumnConfigurationPrefix"

#define kSoapDataSource_RemoteNotificationDeadLinePrefix @"kSoapDataSource_RemoteNotificationDeadLinePrefix"

#define kSoapDataSource_RemoteNotificationStoreFileName @"kSoapDataSource_RemoteNotificationStoreFileName"

#define kNetwork_setPushConfigRequest @"setPushConfig"

#define kNetwork_setPushConfigResponse @"setPushConfigResponse"

#define kBoCPressSoap_RemoteNotificationConfigurationFromServer @"kBoCPressSoap_RemoteNotificationConfigurationFromServer"

#define kBoCPress_ColumnObject @"kBoCPress_ColumnObject"

#define kBoCPress_Global_DeviceToken @"kBoCPress_Global_DeviceToken"

#define kNetwork_getPushConfigRequest @"getPushConfig"

#define kCallbackAction_getRemoteNotificationConfigurationWithCallback @"kCallbackAction_getRemoteNotificationConfigurationWithCallback"

#define kNetwork_getPushConfigResponse @"getPushConfigResponse"

#define kCallbackAction_ViewState_navigateToCertainCriticPostWithInfo @"kCallbackAction_ViewState_navigateToCertainCriticPostWithInfo"

#define kCallbackAction_ViewState_navigateToCertainMediaWithInfo @"kCallbackAction_ViewState_navigateToCertainMediaWithInfo"

#define kCallbackAction_ViewState_navigateToCertainCriticListWithInfo @"kCallbackAction_ViewState_navigateToCertainCriticListWithInfo"

#define kCallbackAction_ViewState_navigateToCertainQuotePageWithInfo @"kCallbackAction_ViewState_navigateToCertainQuotePageWithInfo"

#define kCallbackAction_ViewState_navigateToCertainNewsWithInfo @"kCallbackAction_ViewState_navigateToCertainNewsWithInfo"

#define kSoapConfiguration_RemoteNotificationConfigurableColumnsKey @"kSoapConfiguration_RemoteNotificationConfigurableColumnsKey"

#define kBoCPress_Global_LoadingIndicatorMessageWaiting @"请稍后..."

#define kString_Global_LoadingIndicatorMessageDefault @"正在载入..."

#define kBoCPress_Global_ServerErrorNeedLogin (10002)

#define kBoCPress_Global_ServerErrorPayExpired (10003)

#define kCallbackAction_uploadRemoteNotificationConfiguration @"kCallbackAction_uploadRemoteNotificationConfiguration"

#define kCallbackAction_uploadRemoteNotificationConfigurationDeadLine @"kCallbackAction_uploadRemoteNotificationConfigurationDeadLine"

#define kRemoteNotificationPage_ColumnEnableStatus @"kRemoteNotificationPage_ColumnEnableStatus"


#pragma mark - attached call back info types

#define kBoCPress_AttachedCallbackInfoTypeExecuteWhenDidBeenSwitchToFromOtherTab @"kBoCPress_AttachedCallbackInfoTypeExecuteWhenDidBeenSwitchToFromOtherTab"

#define kBoCPress_AttachedCallbackInfoTypeExecuteWhenWillBrowseBackward @"kBoCPress_AttachedCallbackInfoTypeExecuteWhenWillBrowseBackward"

#define kBoCPress_AttachedCallbackInfoTypeExecuteWhenDidBeenBackwardFromLastPage @"kBoCPress_AttachedCallbackInfoTypeExecuteWhenDidBeenBackwardFromLastPage"

#define kBoCPress_AttachedCallbackInfo_couldExecute @"kBoCPress_AttachedCallbackInfo_couldExecute"

#pragma mark - getPushNotification

#define kNetwork_getPushNotificationRequest @"getPushNotification"

#define kNetwork_getPushNotificationResponse @"getPushNotificationResponse"

#define kCallbackAction_getPushNotification @"kCallbackAction_getPushNotification"

#define kNetwork_getPushNotificationArgument @"kNetwork_getPushNotificationArgument"

#pragma mark - setPushBadge

#define kNetwork_setPushBadgeRequest @"setPushBadge"

#define kNetwork_setPushBadgeResponse @"setPushBadgeResponse"

#define kCallbackAction_setPushBadge @"kCallbackAction_setPushBadge"

#pragma mark - get remote notification from server

#define kNetwork_getPushNotificationListRequest @"getPushNotificationList"

#define kNetwork_getPushNotificationListResponse @"getPushNotificationListResponse"

#define kCallbackAction_getPushNotificationList @"kCallbackAction_getPushNotificationList"

#define kBoCPress_Global_NSMallocBlockObject @"kBoCPress_Global_NSMallocBlockObject"

#define kCallbackAction_didCancelledHandleErrorOfServer @"kCallbackAction_didCancelledHandleErrorOfServer"

#define kCallbackAction_willHandleErrorOfServer @"kCallbackAction_willHandleErrorOfServer"

#define kType_Global_SecurityFamily @"kType_Global_SecurityFamily"

