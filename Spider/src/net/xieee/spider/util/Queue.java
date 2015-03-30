package net.xieee.spider.util;

import java.util.LinkedList;

/**
 * 
 * @author royzhang
 *
 */
public class Queue {

	/**
	 * 使用链表实现队列
	 */
	private LinkedList queueList = new LinkedList();

	/**
	 * 入队列
	 * 
	 * @param object
	 */
	public void enQueue(Object object) {
		queueList.addLast(object);
	}

	/**
	 * 出队列
	 * 
	 * @return
	 */
	public Object deQueue() {
		return queueList.removeFirst();
	}

	/**
	 * 判断队列是否为空
	 * 
	 * @return
	 */
	public boolean isQueueEmpty() {
		return queueList.isEmpty();
	}

	/**
	 * 判断队列是否包含ject元素..
	 * 
	 * @param object
	 * @return
	 */
	public boolean contains(Object object) {
		return queueList.contains(object);
	}

	/**
	 * 判断队列是否为空
	 * 
	 * @return
	 */
	public boolean empty() {
		return queueList.isEmpty();
	}

	/**
	 * 获取url的长度
	 * 
	 * @return
	 */
	public int getSize() {
		return queueList.size();
	}

}