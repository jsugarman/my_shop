module NavbarHelper

	class NavbarBuilder

		attr_reader :t

		def initialize(template)
			@t = template
		end

		def brand_tag(content, url, options = {})
			t.link_to(content, url, { class: 'navbar-brand' }.merge(options) )
		end

		def navbar_tag(options = {}, &block)
			t.content_tag(:ul, { class: 'nav navbar-nav' }.merge(options) ) do
				yield self
			end
		end	

		def navbar_item_tag(content, url, options = {})
			t.content_tag(:li, navbar_item_attrs(url).merge(options) ) do
				t.link_to(content, url)
			end

		end

		def navbar_item_attrs(url)
			current_page?(url) ? { class: 'active' } : {}
		end

		def current_page?(url)
			%r[\A#{url}] =~ t.request.path
		end

	end
	
	# -----------------------------------
	def navbar(options = {}, &block)
		builder = NavbarBuilder.new(self)
		content_tag(:div, { class: 'container'}.merge(options)) do
			yield builder
		end
	end

end