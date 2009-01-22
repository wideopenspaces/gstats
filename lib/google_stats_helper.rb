module GoogleStatsHelper
  # google analytics helper
  # the new GA code uses pageTrackers to set tracking information
  def google_stats    
    add_tracker(:trackPageview, @analytics_url || nil) 
    add_tracker(:setDomainName, GStats.domain) if GStats.domain
    
    google_js
  end
  
  # Use to set a cookie identifying the user as a specific segment of visitors, ie
  #   set_visitor_segment("member") or set_visitor_segment("non-member")
  #
  # Setting this overwrites any previous user segmentation cookie.
  def set_visitor_segment(segment)
    add_tracker(:setVar, segment)
  end
  
  # To set a 'virtual url' for a page , include
  #   <% analytics_url('/flower') %> 
  # somewhere in your view. It will appear in GA as the 'virtual url' instead of the real one.
  def analytics_url(url)
    @analytics_url = url
  end
  
  # Add a tracker to the Google Analytics script. Consult the Google Analytics API docs before randomly adding a tracker :)
  # add_tracker can be invoked from anywhere prior to the output of the stats code
  def add_tracker(tracker, value=nil)
    @trackers ||= {}
    @trackers[tracker] = value
  end
  
  #:nodoc:
  def get_trackers
    pt = @trackers.collect do |tracker, value|
      value ? value = %!"#{value}"! : value = ""    # if value, add quotes; if nil, make a blank string.
      "pageTracker._#{tracker.to_s}(#{value});"
    end
    return pt.join(" ")
  end 
  private :get_trackers
  
  #:nodoc:
  def google_js
    trackers = <<-EOT
      <!-- Start Google Analytics tag -->
      <script type="text/javascript">
      var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
      document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
      </script>
      <script type="text/javascript">
      try {     
      var pageTracker = _gat._getTracker("#{GStats.analytics_account}");
      pageTracker._initData();
      #{get_trackers}
      } catch(err) {}</script>
      <!-- End Google Analytics  tag -->
    EOT
  end
  private :google_js
end