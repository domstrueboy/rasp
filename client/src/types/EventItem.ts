import Periodic from '@/types/Periodic';

interface EventItem {
  id: string;
  title: string;
  desc: string;
  from: Date;
  to: Date;
  periodic: Periodic;
}

export default EventItem;