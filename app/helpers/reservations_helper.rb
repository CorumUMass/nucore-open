module ReservationsHelper
  def add_accessories_link(reservation)
    if reservation.order_detail.accessories? && reservation.reserve_end_at < Time.zone.now
      link_to t('product_accessories.pick_accessories.link'), reservation_pick_accessories_path(reservation), :class => 'has_accessories persistent'
    end
  end

  def reservation_pick_accessories_path(reservation)
    new_order_order_detail_accessory_path(reservation.order_detail.order, reservation.order_detail)
  end

  def default_duration
    @instrument.min_reserve_mins || @instrument.reserve_interval
  end
end
