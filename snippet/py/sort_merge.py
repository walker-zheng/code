#!/usr/bin/python

'''
归并排序: 分治法 + 归并操作
'''

def merge(l1,l2):
    final=[]
    #对l1,l2进行排序
    l1 = sorted(l1)
    l2 = sorted(l2)
    while l1 and l2:
        if l1[0]<=l2[0]:
            final.append(l1.pop(0))
        else:
            final.append(l2.pop(0))
    return final+l1+l2
def mergesort(List):
    ''' 递归合并排序 '''
    mid=int(len(List)/2)
    if len(List)<=1:return List
    return merge(mergesort(List[:mid]),mergesort(List[mid:]))

''' if __name__ == "__main__":
'''
