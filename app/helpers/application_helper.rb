module ApplicationHelper

  def bootstrap_alert_tag(message, options = {})
    

    options.assert_valid_keys(:style, :dismissible)
		valid_styles = %w[success danger	info	warning]

    if options.key?(:style) && !valid_styles.include?(options[:style])

    	raise ArgumentError, "Invalid style argument: #{options[:style].inspect}"
    end

		# assert_valid_values(style: , "Failure message.")as

    wrapper_classes = %w[alert]
    wrapper_classes << "alert-#{options.fetch(:style, 'success')}"
    wrapper_classes << "alert-dismissible" if options.fetch(:dismissible, true)

    wrapper_attrs = {}
    wrapper_attrs[:class] = wrapper_classes.join(' ')
    wrapper_attrs[:role]  = 'alert'

    button_attrs = {}
    button_attrs[:type]  = 'button'
    button_attrs[:class] = 'close'
    button_attrs[:title] = 'Close'
    button_attrs[:data]  = { dismiss: 'alert' }
    button_attrs[:aria]  = { label: 'Close' }

    cross  = content_tag(:span, "×", aria: { hidden: true })
    button = content_tag(:button, cross, button_attrs)

    content_tag(:div, wrapper_attrs) do
      concat(button)
      concat(message)
    end

  end

  # override translate for yml manipulate in view
  def translate(field)
    super("#{@_i18n_scope}.#{field}")
  end
  alias_method :t, :translate

  def with_i18n_scope(scope,&block)
    old_i18n_scope, @_i18n_scope = @_i18n_scope, scope
    yield
  ensure
    @_i18n_scope = old_i18n_scope
  end

end