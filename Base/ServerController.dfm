object IWServerController: TIWServerController
  OldCreateOrder = True
  AppName = 'MyApp'
  Description = 'My IntraWeb Application'
  DisplayName = 'IntraWeb Application'
  Port = 8182
  Version = '15.2.37'
  OnNewSession = IWServerControllerBaseNewSession
  Height = 310
  Width = 342
end
