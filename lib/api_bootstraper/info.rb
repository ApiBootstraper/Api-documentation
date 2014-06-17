module ApiBootstraper
  module Info
    class << self
      def name; 'ApiBootstraper' end
      def url; 'http://apibootstraper.github.com/' end
      def version; "#{ApiBootstraper::APPVERSION.medium}" end
    end
  end
end
